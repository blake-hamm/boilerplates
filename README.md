# boilerplates


## python cookie cutter
```bash
# To leverage python
cd python
nix-shell
conda-shell
conda install conda-forge::cruft

# To create a project from the cookie cutter
cruft create https://github.com/blake-hamm/boilerplates/ \
  --directory python \
  --checkout feature/python-update
```
