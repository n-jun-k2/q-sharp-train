# Q#のリテラル

- [Q#のリテラル](https://docs.microsoft.com/en-us/azure/quantum/user-guide/language/expressions/valueliterals#unit-literal)

| リテラル名 | 概要 | デフォルト値  |
| --- | --- | --- |
| Unit |  関数の引数や戻り値として主に使用されます。voidの代わりとして使用する | ``()`` |
| Int |  2, 8, 10, 16進数の表現が可能です。先頭に``0b``, ``0o``, ``0x``が可能で、それ以外10進数になります。| ``0`` |
| BigInt |  Intリテラルに追加で``L``を後置して定義します。例）10進数の場合：``32L``| ``0L`` |
| Double | 小数点の定義を行う為のリテラルです。 | ``0.0`` |
| Bool | ``true``もしくは``false``のみの定義リテラルです。 | ``false`` |
| String | 文字列に関する定義リテラルです。 | ``""`` |
| Qubit | 量子ビットを表す定義リテラルです。Qubitの値はアロケーション操作を行い取得します。 Qubitの演算子は対等比較のみ可能です。 | invalid qubit |
| Result | 二値量子測定結果の定義リテラルです。``Zero``と``One``のいずれかが定義されます。| ``Zero`` |
| Pauli | このリテラルは次の4つのいずれかが定義されるリテラルになります。(``PauliI``, ``PauliX``, ``PauliY``, ``PauliZ``) 相対位相の回転 | ``PauliI`` |
| Range | このリテラルは``start..step..stop``の式で構成されます。``start``, ``step``, ``end``は全てIntリテラルで定義されます。<br>例) <br>1..3 == 1,2,3<br> 2..2..5 == 2,4;| empty range |
| Array | このリテラルは、``[1,2,3]``のようにカンマ区切りで``[``と``]``で囲んだリテラルが配列として定義されます。特別な配列の初期化ルーチンはMicrosoft.Quantum.Arrays名前空間で見つけることができます。| empty array |
| Tuple | Tupleリテラルは1つ以上の任意のリテラルをカンマ区切りで``(``と``)`` で囲み定義します。| all items are set to default values |
| User Defined Types | ユーザー定義型の定義リテラルです。コンストラクタを呼び出しインスタンス化したものをユーザー定義型と定義。 | all items are set to default values |
| Operation | このリテラルは値として定義できません。グローバルスコープ宣言する必要があり、部分適用を使ってローカルに構築する事ができる。 | invalid operation |
| Function | このリテラルはグローバルスコープで宣言する必要があり、新しいFunctionは部分適用を使用してローカルに構築する事が出来ます。 | invalid operation |
