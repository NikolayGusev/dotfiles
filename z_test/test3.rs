#[allow(dead_code)]
#[allow(unused_variables)]
#[cfg(test)]
pub mod aoc7 {
    use std::{assert_matches::assert_matches, fs};

    use nom::{
        branch::alt,
        bytes::complete::{is_not, tag},
        character::complete::{alpha1, digit1, line_ending},
        combinator::{map_res, opt},
        multi::{many0, many1},
        sequence::{preceded, tuple},
        IResult,
    };

    #[derive(Debug, Clone)]
    struct CdInArgs {
        dir: String,
    }

    #[derive(Debug, Clone)]
    enum Command {
        CdIn(CdInArgs),
        CdOut,
        Ls(Vec<FileSystemEntry>),
    }

    #[derive(Debug, Clone)]
    enum FileSystemEntry {
        File(File),
        Directory(Directory),
    }

    #[derive(Debug, Clone)]
    struct File {
        name: String,
        size: usize,
    }

    #[derive(Debug, Clone)]
    struct Directory {
        name: String,
        files: Vec<File>,
        directories: Vec<Directory>,
    }

    impl Directory {
        pub fn directories<'a>(&'a self) -> Box<dyn Iterator<Item = &Directory> + 'a> {
            Box::new(
                self.directories
                    .iter()
                    .chain(self.directories.iter().map(|d| d.directories()).flatten()),
            )
        }
        pub fn files<'a>(&'a self) -> Box<dyn Iterator<Item = &File> + 'a> {
            Box::new(
                self.files
                    .iter()
                    .chain(self.directories.iter().map(|d| d.files()).flatten()),
            )
        }
    }

    fn directory_size(dir: &Directory) -> usize {
        dir.files().map(|f| f.size).sum()
    }

    struct Answer {
        top_goods: String,
    }

    fn read_file_string(filepath: &str) -> Result<String, Box<dyn std::error::Error>> {
        let data = fs::read_to_string(filepath)?;
        Ok(data)
    }

    fn parse_cd(s: &str) -> IResult<&str, Command> {
        let (s, dir) = preceded(tag("$ cd "), alt((alpha1, tag(".."), tag("/"))))(s)?;

        if dir == ".." {
            Ok((s, Command::CdOut))
        } else {
            Ok((
                s,
                Command::CdIn(CdInArgs {
                    dir: String::from(dir),
                }),
            ))
        }
    }

    fn parse_to_usize(s: &str) -> IResult<&str, usize> {
        fn from_str(input: &str) -> Result<usize, std::num::ParseIntError> {
            input.parse()
        }

        map_res(digit1, from_str)(s)
    }

    fn parse_ls_file(s: &str) -> IResult<&str, FileSystemEntry> {
        let (s, (size, _, name)) = tuple((parse_to_usize, tag(" "), is_not(" \t\n")))(s)?;
        Ok((
            s,
            FileSystemEntry::File(File {
                name: String::from(name),
                size,
            }),
        ))
    }

    fn parse_ls_dir(s: &str) -> IResult<&str, FileSystemEntry> {
        let (s, (_, _, name)) = tuple((tag("dir"), tag(" "), is_not(" \t\n")))(s)?;
        Ok((
            s,
            FileSystemEntry::Directory(Directory {
                name: String::from(name),
                directories: vec![],
                files: vec![],
            }),
        ))
    }

    fn parse_ls(s: &str) -> IResult<&str, Command> {
        let (s, _) = tuple((tag("$ ls"), line_ending))(s)?;
        let (s, contents) = many0(tuple((alt((parse_ls_file, parse_ls_dir)), line_ending)))(s)?;
        let contents: Vec<FileSystemEntry> = contents.iter().map(|x| x.0.clone()).collect();
        Ok((s, Command::Ls(contents)))
    }

    fn parse_commands(s: &str) -> IResult<&str, Vec<Command>> {
        let (s, commands) = many1(tuple((alt((parse_ls, parse_cd)), opt(line_ending))))(s)?;
        let commands: Vec<Command> = commands.iter().map(|x| x.0.clone()).collect();

        // let (s, commands) = many1(alt((parse_ls, parse_cd)))(s)?;
        return Ok((s, commands));
    }

    fn fold_commands(commands: Vec<Command>) -> Vec<FileSystemEntry> {
        let root_dir = Directory {
            name: String::from("/"),
            files: vec![],
            directories: vec![],
        };
        struct Acc {
            entries: Vec<FileSystemEntry>,
            current_dir: Directory,
        }
        let seed: Acc = Acc {
            entries: vec![],
            current_dir: root_dir,
        };
        let tree: Vec<FileSystemEntry> = commands
            .iter()
            .fold(seed, |acc, cmd| {
                let a = match cmd {
                    Command::CdIn(CdInArgs { dir }) => 123,
                    _ => 321,
                };
                // acc
                todo!();
            })
            .entries;
        return tree;
    }

    fn main_thingie() {
        // let s = (read_file_string(file_path).expect("must be present in test scenario") + "\n")
        // .clone()
        // .as_str();

        todo!();
    }

    #[test]
    fn cd_parser_works_cd_in() {
        let res = parse_cd("$ cd myDir").unwrap();
        assert!(matches!(res.1, Command::CdIn(CdInArgs { dir }) if dir == "myDir"));
    }

    #[test]
    fn cd_parser_works_cd_out() {
        let res = parse_cd("$ cd ..").unwrap();
        assert!(matches!(res.1, Command::CdOut));
    }

    #[test]
    fn parse_ls_dir_works() {
        let res = parse_ls_dir("dir d").unwrap();
        assert_matches!(res.1, FileSystemEntry::Directory(Directory {name, ..}) if name == "d");
    }

    #[test]
    fn parse_ls_file_works() {
        let res = parse_ls_file("8033020 d.log").unwrap();
        // assert!(matches!(res.1, File { name, size: 8033020 } if name == "d.log"));
        assert_matches!(res.1, FileSystemEntry::File(File { name, size }) if name == "d.log" && size == 8033020 );
    }

    #[test]
    fn ls_parser_works() {
        let res = parse_ls(
            "$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
",
        )
        .unwrap();
        assert_matches!(res.1, Command::Ls(entries) if entries.len() == 4)
    }

    #[test]
    fn parse_commands_works() {
        let res = parse_commands(
            "$ cd /
$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
$ cd a
$ ls
dir e
29116 f
2557 g
62596 h.lst
$ cd e
$ ls
584 i
$ cd ..
$ cd ..
$ cd d
$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k
",
        )
        .unwrap();
        assert_eq!(res.1.len(), 10);
        assert_eq!(res.0.len(), 0);
        // assert_matches!(res.1, Command::Ls(entries) if entries.len() == 4)
    }
}
