namespace multiple_qubit {

    open Microsoft.Quantum.Canon; // for ApplyToEach
    open Microsoft.Quantum.Intrinsic;
    
    open Microsoft.Quantum.Diagnostics; // for DumpMachine
    open Microsoft.Quantum.Measurement; // for MultiM


    operation QByteOperation(op: Qubit[] => Unit, msg: String, qsize: Int) : Unit {
        use qubyte = Qubit[qsize] {
            op(qubyte);
            let value = MultiM(qubyte);
            Message($"{msg} : {value}");
            // DumpMachine();
        }
    }

    operation QByteOperationToEach(op: Qubit => Unit, msg: String, qsize: Int) : Unit {
        QByteOperation(q => ApplyToEach(op, q), msg, qsize);
    }

    @EntryPoint()
    operation HelloQ() : Unit {

        let BYTE_SIZE = 8;

        QByteOperation(ResetAll, $"Rset ALL", BYTE_SIZE);
        QByteOperationToEach(H, $"Reflect {H}", BYTE_SIZE);
        QByteOperationToEach(X, $"Reflect {X}", BYTE_SIZE);
        QByteOperationToEach(Y, $"Reflect {Y}", BYTE_SIZE);
        QByteOperationToEach(Z, $"Reflect {Z}", BYTE_SIZE);
        QByteOperationToEach(T, $"Reflect {T}", BYTE_SIZE);
        QByteOperationToEach(I, $"Reflect {I}", BYTE_SIZE);
        QByteOperationToEach(S, $"Reflect {S}", BYTE_SIZE);

        let pauliAllList = [PauliX, PauliY, PauliZ, PauliI];

        for pauli in pauliAllList {
            let theta = 180.0;
            let PauliRTheta = (q) => R(pauli, theta, q);
            QByteOperationToEach(PauliRTheta, $"{R} {theta} {pauli}", BYTE_SIZE);

            let ExpOp = q => Exp([pauli, size=BYTE_SIZE], theta, q);
            QByteOperation(ExpOp, $"{Exp} {theta} {pauli}", BYTE_SIZE);

            let numerator = 10;
            let power = 10;
            let ExpFracOp = q => ExpFrac([pauli, size=BYTE_SIZE], numerator, power, q);
            QByteOperation(ExpFracOp, $"{ExpFrac} {pauli} {numerator} {power}", BYTE_SIZE);
        }

        for r in [Rx, Ry, Rz] {
            let theta = 90.0;
            let RTheta = q => r(theta, q);
            QByteOperationToEach(RTheta, $"{r} {theta}", BYTE_SIZE);
        }

        for pauli in pauliAllList {
            use q = Qubit[BYTE_SIZE] {
                let result = Measure([pauli, size=BYTE_SIZE], q);
                Message($"Measure {pauli} {result}");
                ResetAll(q);
            }
        }

    }
}

