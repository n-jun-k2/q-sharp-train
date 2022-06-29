namespace core {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    open Microsoft.Quantum.Core;

    @Attribute()
    newtype NewType1 = (Unit);

    @NewType1()
    function F1() : Unit {
        Message("F1");
    }

    @Attribute()
    newtype NewType2 = (msg: String);

    @NewType2("Test")
    function F2() : Unit {
        Message("F2");
    }

    @Attribute()
    newtype NewType3 = (func: (Unit) -> Int);

    operation Op1() : Unit {
        mutable type = NewType3(Functions.Func);
        let f = type::func();
        Message($"value is {type::func()}");
    }


    @EntryPoint()
    operation Main() : Unit {
        F1();
        F2();
        Op1();
    }
}

