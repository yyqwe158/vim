```
#nodejs
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
nvm install 22.22.0
```

```
#Plug
:PlugInstall
:CocInstall coc-python coc-pyright coc-snippets
```

```
#vimspector
pip install debugpy autopep8
cd ~/.vim/plugged/vimspector
python install_gadget.py --enable-python
mkdir -p ~/.vim/plugged/vimspector/configurations/linux/python
cp ~/.vim/default.json ~/.vim/plugged/vimspector/configurations/linux/python/
```

