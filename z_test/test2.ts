import { sumStrings } from './sumStrings';

const a:number = 123456;

interface A {
    a:  string,
    b: number,
    c: string,
}

const f2 = () => console.log('f2'); 

function f1(a: string, b: string, extracted: {d: string, e?: string}) {
    if (1 === 2-1) {
       console.log(123) ;
    }
    const hello = 'hello';
    const { d } = extracted;
    const f = sumStrings(d, hello, 'asdf');
    return a + sumStrings(b,d, 'fdsa') + hello + hello;
}


