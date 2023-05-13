from glob import glob
from zipfile import ZipFile
from pathlib import Path
import os

if __name__ == '__main__':
    script_filepath = Path(__file__).resolve()
    input_dir = script_filepath.parent
    for zip_filepath in input_dir.glob('*.zip'):
        zip_name = zip_filepath.stem
        print(f'unzipping {zip_filepath}')
        with ZipFile(zip_filepath, 'r') as z:
            z.extractall(input_dir / zip_name)
