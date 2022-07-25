namespace Initilize {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    open Microsoft.Quantum.Arrays;

    /// # Summary
    /// 単一の量子ビットを任意のRsult型に合わせる。
    ///
    /// # Input
    /// ## v (Result)
    /// 初期化したいQubitの値を指定
    /// ## q (Qubit)
    /// 初期化対象のQubit
    ///
    /// # Example
    /// ```Q#
    /// let q = Qubit();
    /// Set(One, q);
    /// ```
    ///
    operation Set(v: Result, q: Qubit) : Unit {
        Reset(q);
        if v == One {
            X(q);
        }
    }

    /// # Summary
    /// 複数の量子ビットをResult配列で初期化を行う
    /// 
    /// # Input
    /// ## v (Result[])
    /// 初期化したいQubitの値を指定
    /// ## q (Qubit[])
    /// 初期化対象のQubit配列
    ///
    /// # Example
    /// ```Q#
    ///  let q = Qubit[2];
    ///  MultiSet([One, Zero], q);
    /// ```
    ///
    operation MultiSet(v: Result[], q: Qubit[]) : Unit {
        if Length(v) != Length(q) {
            fail "sized do not match.";
        }

        ResetAll(q);
        for idx in IndexRange(v) {
            if v[idx] == One {
                X(q[idx]);
            }
        }
    }

}