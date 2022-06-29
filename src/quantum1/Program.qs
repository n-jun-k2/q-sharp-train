namespace quantum1 {

    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Measurement; // for MultiM
    open Microsoft.Quantum.Canon; // for ApplyToEach

    function InvalidQubit(): Unit {
        mutable q = new Qubit[3];
        Debug.Print($"{q}");
    }

    operation BitOperation(): Result {
        use q = Qubit() {
            H(q);
            return M(q);
        }
    }

    operation ByteOperation(byteSize: Int): Result[] {
        use qbyte = Qubit[byteSize] {
            ApplyToEach(H, qbyte);
            return MultiM(qbyte);
        }
    }

    operation UseDefine() : Unit {
        // bit
        use qbit = Qubit();
        Debug.Print($"{qbit} {M(qbit)}");

        // byte
        let BYTE_SIZE = 8;
        use qbyte = Qubit[BYTE_SIZE];
        Debug.Print($"{qbyte} : {qbyte[0]}, {qbyte[1]} value is {MeasureInteger(LittleEndian(qbyte))} {LittleEndian(qbyte)}");

        use (qbit1, qbyte1) = (Qubit(), Qubit[BYTE_SIZE]);
        Debug.Print($"{qbit1}, {qbyte1}");

        use qbit2 = Qubit() {
            Debug.Print($"{qbit2}");
        }
        // Debug.Print($"{qbit2}"); QS5022

        use qbyte2 = Qubit[BYTE_SIZE] {
            Debug.Print($"{qbyte2}");
        }

        for i in 0..10 {
            use q = Qubit() {
                Debug.Print($"{q}");
            }
        }
    }

    operation BorrowDefine() : Unit {
        let BYTE_SIZE = 8;

        borrow qbit = Qubit();
        Debug.Print($"{qbit} {M(qbit)}");

        // byte
        borrow qbyte = Qubit[BYTE_SIZE];
        Debug.Print($"{qbyte} : {qbyte[0]}, {qbyte[1]} value is {MeasureInteger(LittleEndian(qbyte))} {LittleEndian(qbyte)}");

        borrow (qbit1, qbyte1) = (Qubit(), Qubit[BYTE_SIZE]);
        Debug.Print($"{qbit1}, {qbyte1}");

        borrow qbit2 = Qubit() {
            Debug.Print($"{qbit2}");
        }
        // Debug.Print($"{qbit2}"); QS5022

        borrow qbyte2 = Qubit[BYTE_SIZE] {
            Debug.Print($"{qbyte2}");
        }
    }

    @EntryPoint()
    operation HelloQ() : Unit {
        Debug.Print("_/_/_/_/_/_/_/_/");
        InvalidQubit();
        Debug.Print("_/_/_/_/_/_/_/_/");
        UseDefine();
        Debug.Print("_/_/_/_/_/_/_/_/");
        BorrowDefine();
        Debug.Print("_/_/_/_/_/_/_/_/");
        let qbit = BitOperation();
        Debug.Print($" value is {qbit}");
        let qbyte = ByteOperation(8);
        Debug.Print($"value is {qbyte}");
    }
}