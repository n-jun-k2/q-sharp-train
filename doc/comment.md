# コメント

q#では以下のようなコメントヘッダーで説明します。

| | |
|---|---|
|Summary| function,operationの等の動作や目的の要約。 |information. It should be plain text.
|Description| functionまたはoperationの動作または型の目的の説明。要約と説明は連結されて形成されます |
|Input| operationまたはfunctionの入力tupleの説明。各要素を示す追加のMarkdownサブセクションが含まれる場合があります |
|Output| operationまたはfunctionによって返されるtupleの説明。|
|Type Parameters| ジェネリック型パラメーターごとに1つの追加サブセクションを含む空のセクション。|
|Named Items| ユーザー定義タイプの名前付きアイテムの説明。それぞれの説明を含む追加のMarkdownサブセクションが含まれる場合があります |named item.
|Example| operation、function、またはタイプの簡単な例。|
|Remarks| operation、function、またはタイプのいくつかの側面を説明する。|
|See Also| 関連するfunction、operation、またはユーザー定義型を示す完全修飾名のリスト。|
|References| 文書化された項目の参照と引用のリスト。|

```C#
/// # Summary
/// Given an operation and a target for that operation,
/// applies the given operation twice.
///
/// # Input
/// ## op
/// The operation to be applied.
/// ## target
/// The target to which the operation is to be applied.
///
/// # Type Parameters
/// ## 'T
/// The type expected by the given operation as its input.
///
/// # Example
/// ```Q#
/// // Should be equivalent to the identity.
/// ApplyTwice(H, qubit);
/// ```
///
/// # See Also
/// - Microsoft.Quantum.Intrinsic.H
```