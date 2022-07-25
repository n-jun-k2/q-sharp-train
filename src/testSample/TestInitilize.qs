namespace TestInitilize {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Measurement; // for MultiM
    open Microsoft.Quantum.Arithmetic; // for LittleEndian

    open Initilize;

    /// # Summary
    /// AssertQubitの配列対応型
    ///
    /// # Input
    /// ## expected (Result[])
    /// 予想値
    /// ## q (Qubit[])
    /// 状態がアサートされているQubit配列
    ///
    operation AssertAllQubit (expected : Result[], q : Qubit[]) : Unit is Adj + Ctl {
        for (l, r) in Zipped(expected, q) {
            AssertQubit(l, r);
        }
    }

    @Test("QuantumSimulator")
    operation SetOneQubit() : Unit {
        let results = [One, Zero];
        use q = Qubit();
        for result in results {
            Set(result, q);
            AssertQubit(result, q);
        }
        Reset(q);
        Message("Test passed.");
    }

    @Test("QuantumSimulator")
    operation MultiSetQubit() : Unit {
        let ARRAYSIZE = 4;
        let rArrays = [
            [One, size = ARRAYSIZE],
            [Zero, size = ARRAYSIZE],
            [One, Zero, One, One]
        ];

        use qArray = Qubit[ARRAYSIZE * Length(rArrays)];
        mutable start = 0;
        mutable end = 0;
        for idx in IndexRange(rArrays) {
            set start = idx * ARRAYSIZE;
            set end = (start + ARRAYSIZE) - 1;
            let q = qArray[start..end];
            MultiSet(rArrays[idx], q);
            AssertAllQubit(rArrays[idx], q);
        }
        ResetAll(qArray);
        Message($"Test passed.");
    }
}