# How to install Cabal

1. At [ghcup-hs](https://gitlab.haskell.org/haskell/ghcup-hs), somehow using `Simple bootstrap` to install only give us very old version of Cabal. Use Manual Install instead.

After downloading the binary, assume the binary name is `binary-name`, give it execute permission

```shell
chmod +x binary-name
```
Adjust PATH in ~/.bashrc as mentioned in the `ghcup-hs` README

```shell
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"
```

Install `ghc` using the binary. After running the binary once, the binary will create a folder `~/.ghcup` in your home directory. From then on, you can use `ghcup` instead of the binary

```
./binary-name install ghc # This might not install the latest ghc since the ghcup binary might be out of date
ghcup upgrade             # If the latest ghc is not installed, upgrade ghcup
ghcup rm ghc              # Remove the installed ghc
ghcup install ghc         # Install the latest ghc
ghcup install cabal       # Install the latest cabal
ghc --version             # ghc might not be found since there is no binary named ghc in ~/.ghcup/bin. If this runs, skip the
                          # following commands
cd ~/.ghcup/bin           # In here, you will see a lot of binary but they would all have version number attached

```
