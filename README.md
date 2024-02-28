# Link

Link is a simple Bash script designed to aid file management tasks by providing functionality for copying, moving, or symbolic linking files in a straightforward manner. It also works across multiple terminal sessions. 

## Installation

1. Clone this repository or download the `link.sh` script.
2. Source the link script:
    ```bash
    source link.sh
    ```

## Usage

### Linking a file in
To establish a reference to a file for future operations, use:
```bash
link in <file>
```

### Copying a file
To duplicate a linked file to a designated destination, use:
```bash
link cp <destination>
```

### Moving a file
To relocate a linked file to a specified destination, use:
```bash
link mv <destination>
```


## Example

An example workflow could involve linking a file named `example.txt` and then copying it to another directory:
```bash
link in example.txt
cd <destination>
link cp .
```

## Notes

- This script stores the path of the linked file in the `~/.link/in.link` file

## License

This script is licensed under the [MIT License](LICENSE).
