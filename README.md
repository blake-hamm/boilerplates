# boilerplates

## Python

To create a new Python project from this boilerplate, you'll need to have `nix` and `cruft` installed.

First, navigate to the `python` directory:

```bash
cd python
```

Then, use `cruft` to create a new project. This will prompt you for project-specific details like the project name and description.

```bash
cruft create https://github.com/blake-hamm/boilerplates/ \
  --directory python \
  --checkout feature/python-update
```

This will create a new directory with your project's name. Navigate into that directory:

```bash
cd <your-project-name>
```

Once inside your project's directory, you can use the following commands to set up your development environment.

First, enter the `nix` development environment:

```bash
nix develop
```

This will provide you with a shell that has `python` and `uv` available.

Next, create a virtual environment using `uv`:

```bash
uv venv
```

Activate the virtual environment:

```bash
source .venv/bin/activate
```

Finally, install the project's dependencies:

```bash
uv sync --all-extras
```

Now you're all set up to start developing!
