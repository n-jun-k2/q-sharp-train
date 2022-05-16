namespace sample5 {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    @EntryPoint()
    operation Main() : Unit {
        F(1, 0.10);                               //1 0.1
        F(2, "moji");                             //2 moji
        F(3, 1);                                  //3 1
        let d = O(4, 0.05, x -> Message($"{x}")); //4
        let _ = O(5, (), x -> Message($"{x}"));   //5
    }

    function F<'T> (x: Int, y: 'T): Unit {
        Message($"{x} {y}");
    }

    operation O<'IT, 'OT> (x: 'IT, y: 'OT, Opt: 'IT -> Unit) : 'OT {
        Opt(x);
        return y;
    }

    function Fop (x: Int) : Unit {
        body (...) {
            Message($"{x}");
        }
    }

    operation Op (x: Int) : Unit {
        Message ($"{x}");
    }

    operation Unitary () : Unit {
        body (...) {
            Message ("invocation of 'Unitary'"); 
        }

        adjoint (...) {
            Message ("invocation of 'Adjoint Unitary'"); 
        }

        controlled (cs, ...) {
            Message ("invocation of 'Controlled Unitary'"); 
        }

        controlled adjoint (cs, ...) {
            Message ("invocation of 'Controlled Adjoint Unitary'"); 
        }
    }
}

