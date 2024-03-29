import "@logseq/libs";
import { a, b, c } from 'asdf';
const testChange = 1;
const r = {
  a: 1;
  ba: 2;
  c: 3;
};

// MYTODO

const World = function(props: any) {
  return (
    <>
      <a href="hello" style={props.style}>
        {props.urlDescription}
      </a>
      <a href="hello" style={props.style}>
        {props.urlDescription}
      </a>
      <a href="hello" style={props.style}>
        {props.urlDescription}
      </a>
      <a href="hello" style={props.style}>
        {props.urlDescription}
      </a>
      <a href="hello" style={props.style}>
        {props.urlDescription}
      </a>
    </>
  );
}


function f<T, T2>(a: string, b: number) {
  return null;
}

// Cannot swap args around in that one.
fn split_into_row_ranges(row: & str) -> RowRanges {
  row.split([',', '-']);
}

rust_variable_for_av_and_iv
rust_variable_for_av_and_iv
rust_variable_and_iv
rust_variable_for_av_and_iv
rust_variable_for_av_and_iv
// TODO: test todo1

const opts = { type: "select", ...enqOpts };

type MyType<T> = {
  value: Option<T>;
  result: string;
}
/*
struct ReadUserInput {
    result: Result < i32, std:: num:: ParseIntError >,
    guess_str: String,
}
*/

abc defg
abc asdf
abc defg
type RarityDistribution = { rarity: Rarity; perc: number; }[];
type RarityDistribution2 = {
  perc: number;
  rarity: Rarity;
}[];
a_b_c
[a; b; c]
{ a; b; c }

export interface Example {
  name: string;
  items: {
    [key: string]: Item
  };
}
export interface Example { name: string; items: { key: string }; }
export interface Example { name: string; items: (key: string) }
export interface Example { items: 123; name: { 123 }; }
export interface Example { name: { 123 }; items: 123 }
export interface Example { items: 123; name: { 123 }; }
export interface Example { items: 123; name: string; }

const ref1 = 1;
const ref2 = 2;
const resultSum = ref1 + ref2;


const myWorldHere = ("world");
const c = some_func([1, 2], 1, 2, 3, True, lst = [], kw1 = False, d = { 2, 3});
const d = someFunc2("hello", "world", 42)
const b = [1, 2, 3, 4];
const a = `why
87


hello
${world}
how
are
you
doing


`;

// TODO: test todo1

const comp = () => {
  return <div>
    <div>hello</div>
    <div>hello</div>

    <div>
      <span>
        test
      </span>
    </div>
    <div>hello</div> <div>hello</div> <div>hello</div> <div>hello</div>
    <div>Hello</div> <div>hello</div> <div>Hello</div> <div>hello</div>
    <div>Hello</div> <div>hello</div> <div>Hello</div> <div>hello</div>
    <div>hello</div>
  </div>
}

export function getRarityColor(rarity: Rarity) {
  switch (rarity) {
    case "legendary":
      return "#f5b642";
    case "epic":
      return "#ec42f5";
    case "rare":
      return "#42b3f5";
    case "common":
      return "black";
  }
}


export type Reward = {
  name: string;
  rarity: Rarity;
};

const commonProbabilities: RarityDistribution = [
  { rarity: "common", perc: 93.8 },
  { rarity: "rare", perc: 5 },
  { rarity: "epic", perc: 1 },
  { rarity: "legendary", perc: 0.2 },
];

const rareProbabilities: RarityDistribution = [
  { rarity: "rare", perc: 89 },
  { rarity: "epic", perc: 9 },
  { rarity: "legendary", perc: 2 },
];

export const dustPrices: { [rarity in Rarity]: string } = {
  common: "100 rub",
  rare: "500 rub",
  epic: "2500 rub",
  legendary: "10 000 rub",
};

function getRarity(distr: RarityDistribution): Rarity {
  if (distr.reduce((acc, { perc }) => acc + perc, 0) !== 100) {
    const msg = "Invalid distribution.";
    logseq.App.showMsg(msg, "error");
    throw new Error(msg);
  }

  const rnd = Math.random() * 100;
  let accumulatedPerc = 0;
  for (const x of distr) {
    if (rnd <= x.perc + accumulatedPerc) return x.rarity;
    accumulatedPerc += x.perc;
  }
  throw new Error(`Couldn't find rarity`);
}

export function getPackRarities() {
  return [1, 2, 3, 4, 5].map((i) =>
    i === 1 ? getRarity(rareProbabilities) : getRarity(commonProbabilities)
  );
}

export const tags = {
  rarity: {
    legendary: "legendary_reward",
    epic: "epic_reward",
    rare: "rare_reward",
    common: "common_reward",
  },
  wonRarity: {
    legendary: "legendary_reward_won",
    epic: "epic_reward_won",
    rare: "rare_reward_won",
    common: "common_reward_won",
  },
  wonThisReward: "won_this_reward",
  infiniteReward: "infinite_reward",
} as const;

export async function getRewardsByRarity(rarity: Rarity) {
  const rarityTag = tags.rarity[rarity];

  console.log("logseq!");
  const results = await logseq.DB.datascriptQuery(
    `[:find 
          (pull ?b [:block/title :block/uuid]) 
      :where 
          [?b :block/refs [:block/name "${rarityTag}"]] 
          (not [?b :block/refs [:block/name "${tags.wonThisReward}"]])
    ]`
  );

  return (
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    (results.flatMap((x: unknown) => x) as any[])
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      .map((x: any) => ({
        title: x.title[0][1] as string,
        uuid: x.uuid["$uuid$"] as string,
      }))
  );
}

export async function markRewardAsReceived(blockId: string) {
  const block = await logseq.Editor.getBlock(blockId, {
    includeChildren: true,
  });

  if (block == null) {
    // eslint-disable-next-line no-console
    console.error(`Cannot find block with id ${blockId} `);
    return;
  }

  if (block.content.includes("#" + tags.infiniteReward)) return;

  const split = block.content.split("\n");
  const newValue = [
    split[0] + " " + ("#" + tags.wonThisReward),
    ...split.splice(1),
  ].join("\n");
  console.log(newValue);
  await logseq.Editor.updateBlock(blockId, newValue);
}
