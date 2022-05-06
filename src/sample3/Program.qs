namespace sample3 {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    

    /// # Summary
    /// 条件処理
    /// 
    /// # Input
    /// - i (Int): 判定処理するための適当な要素。
    ///
    function F1(i: Int) : Unit {
        if i < 0 {
            Message($"Is less than 0.");
        }
        else {
            Message("It is 0 or more.");
        }
    }

    /// # Summary
    /// 条件処理
    /// 
    /// # Input
    /// - i (int): 判定処理するための適当な要素。
    ///  0 or 1 で条件式メッセージ。 
    /// 
    function F2(i: Int) : Unit {
        if i == 0 {
            Message("i == 0");
        }
        elif i == 1 {
            Message("i == 1");
        }
        else {
            Message("else");
        }
    }

    @EntryPoint()
    operation Main() : Unit {
        Message("Hello quantum world!");

        F1(10);
        F1(0);
        F1(-1);

        F2(0);
        F2(1);
        F2(3);
    }
}

