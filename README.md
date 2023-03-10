# 概要

- CUDAを利用した関数のライブラリ  
- 上記ライブラリを利用した実行ファイル  

をビルドするレポジトリ。  
(CUDAを利用した関数は、一次元配列の各要素を二倍する関数のみ。)  


# 実行環境

試した環境

- nvidia driver : 525.85.05
- CUDA toolkit  : 11.3
- cmake         : 3.21

# インストール

```
$ cd libcuda_example
$ make
```

で、`libcuda_example/install`以下に下記のファイルが作成される。

```
libcuda_example/install
├── bin
│   └── run                 : 実行ファイル (CUDAを利用した関数の実行)
├── include
│   └── CudaVecDouble.h     : CUDAを利用した関数ライブラリのヘッダファイル
└── lib
    └── libCudaVecDouble.a  : CUDAを利用した関数の静的ライブラリ
```

# 実行

インストール後

```
$ make run
もしくは
$ ./install/bin/run
```

で、CUDAを利用した関数を適当なベクトルで実行できる。
