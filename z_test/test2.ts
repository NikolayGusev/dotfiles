const a:number = 123;


function f1(a: string, b: string, extracted: {d: string, e?: string}) {
    const hello = 'hello';
    const { d } = extracted;
    const f = sumStrings(d, hello);
    return a + sumStrings(b,d) + hello + hello;
}

function sumStrings(d: string, hello: string) {
    return d + hello;
}
