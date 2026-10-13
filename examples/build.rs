//! サブモジュール `schema/` の GraphQL スキーマからビルド時にコードを生成する雛形。
//!
//! - 生成物は `OUT_DIR` に出力するのでリポジトリにはコミットしない
//! - スキーマのバージョン = backend が記録しているサブモジュールのコミット ID
//!   なので、どのブランチ・どのタグをビルドしても生成コードとスキーマが必ず一致する
//!
//! 利用側（例: src/schema.rs）:
//!     include!(concat!(env!("OUT_DIR"), "/schema_types.rs"));

use std::{env, fs, path::PathBuf};

const SCHEMA_PATH: &str = "schema/schema.graphql";

fn main() {
    // スキーマが変わったときだけ再生成する
    println!("cargo:rerun-if-changed={SCHEMA_PATH}");

    let sdl = fs::read_to_string(SCHEMA_PATH).unwrap_or_else(|_| {
        panic!(
            "{SCHEMA_PATH} が見つかりません。\n\
             サブモジュールを取得してください: git submodule update --init --recursive"
        )
    });

    let code = generate(&sdl);

    let out = PathBuf::from(env::var("OUT_DIR").unwrap()).join("schema_types.rs");
    fs::write(out, code).expect("生成コードの書き込みに失敗しました");
}

/// SDL から Rust コードを生成する。
///
/// ここはプロジェクトで採用するコード生成処理に置き換える
/// （自作のジェネレータ crate を build-dependencies に入れて呼び出す等）。
fn generate(sdl: &str) -> String {
    let _ = sdl;
    String::from("// generated from schema/schema.graphql\n")
}
