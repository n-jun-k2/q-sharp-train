namespace sample4 {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    @EntryPoint()
    function Main() : Unit {
        let sum = (x) -> x + 10;
        let a = sum(10);

        Message($"sum = {a}");

        let sum2 = (x, y) -> x + y;
        let b = sum2(10, 20);

        Message($"sum2 = {b}");

        Callback(msg);
        Callback(x -> $"lambda message. value = {x}");

        Callback2(50, (x, y) -> $"{y} {x}");
    }

    /// # Summary
    /// 整数を受け取りメッセージを返す。
    /// 
    /// # Input
    /// - i (int) : 適当な整数
    function msg(i: Int) : String {
        return $"msg : {i}";
    }

    /// # Summary
    /// コールバック練習
    /// 
    /// # Input
    /// - toStr (int) -> String : 整数を受け取り何らかの文字列を返す。
    ///
    function Callback (toStr:Int -> String) : Unit {
        let i = 10;
        Message($"get message {toStr(i)}");
    }

    /// # Summary
    /// コールバック練習２
    /// 
    /// # Input
    /// - type (Int) : 何らかの整数値
    /// - toStr (Int, String) -> String : 整数と文字列を受け取り何らかの文字列を返す。
    /// 
    function Callback2 (type: Int, toStr: (Int, String) -> String) : Unit {
        let msgHead = "INFO:";
        Message(toStr(type, msgHead));
    }
}

