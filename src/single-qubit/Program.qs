namespace qbit {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    open Microsoft.Quantum.Diagnostics; // for DumpMachine

    operation QubitOperation(op: Qubit => Unit, msg: String) : Unit {
        use q = Qubit() {
            op(q);
            let result = M(q);
            Message($"{msg} : {result}");
            DumpMachine();
        }
    }

    @EntryPoint()
    operation HelloQ() : Unit {

        QubitOperation(Reset, "Reset");
        QubitOperation(H, "Reflect H");
        QubitOperation(X, "Reflect X");
        QubitOperation(Y, "Reflect Y");
        QubitOperation(Z, "Reflect Z");
        QubitOperation(T, "Reflect T");
        QubitOperation(I, "Reflect I");
        QubitOperation(S, "Reflect S");

        for pauli in [PauliI, PauliX, PauliY, PauliZ] {
            let theta = 90.0;
            let PauliRTheta = q => R(pauli, theta, q);
            QubitOperation(PauliRTheta, $"R {theta} {pauli}");

            let ExpOp = q => Exp([pauli], theta, [q]);
            QubitOperation(ExpOp, $"Exp {theta} {pauli}");
            
            let numerator = 10;
            let power = 10;
            let ExpFracOp = q => ExpFrac([pauli], numerator, power, [q]);
            QubitOperation(ExpFracOp, $"ExpFrac {pauli} {numerator} {power}");
        }

        for r in [Rx, Ry, Rz] {
            let theta = 90.0;
            let R90 = q => r(theta, q);
            QubitOperation(R90, $"{r} {theta}");
        }

        use (q0, q1) = (Qubit(), Qubit()) {
            X(q0); // q1 = |1>
            SWAP(q0, q1);
            let result0 = M(q0);
            let result1 = M(q1);
            Message($"SWAP({q0},{q1}) = ({result0},{result1})");
            DumpMachine();
        }

        use q = Qubit() {
            let result = Measure([PauliI], [q]);
            Message($"Measure({q}) = {result}");
            DumpMachine();
        }

        use (q, qq) = (Qubit(), Qubit()) {
            let result = Measure([PauliI, PauliI], [q, qq]);
            Message($"Measure({q}, {qq}) = {result}");
            DumpMachine();
        }

        use q = Qubit() {
            Message($"X qubit");
            X(q);
            DumpMachine();
            Message($"reset qubit");
            Reset(q);
            DumpMachine();
        }
    }
}

