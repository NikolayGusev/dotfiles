import { sumStrings } from './sumStrings';

const a:number = 123456;

interface A {
    a:  string,
    b: number,
    c: string,
}

//  Try "gr" here    v
//     initialState={}
//     initialState=[] <- or here
//     initialState=""
//       or here    ^ 

//  Try "gr" here    v
//     initialState={ }
//     initialState=[ ] <- or here
//     initialState=" "
//       or here    ^ 
//
const f2 = () => console.log('f2'); 

function f1(a: string, b: string, extracted: {d: string, e?: string}): string {
    if (1 === 2-1) {
       console.log(123) ;
    }
    const hello = ["hello", "hello", "hello"];
    const { d } = extracted;
    const f = sumStrings(d, hello[0], 'asdf');
    return a + sumStrings(b,d, 'fdsa') + hello + hello;
}
const f3 = (
    a: number, 
    b: number,
    c: number,
    d: number,
    e: number,
    ): number => {
    return a +b;
}



