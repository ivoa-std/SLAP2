[![PDF-Preview](https://img.shields.io/badge/Preview-PDF-blue)](../../releases/download/auto-pdf-preview/SLAP-draft.pdf)

# Simple Line Access Protocol

The Simple Line Access Protocol (SLAP) is an IVOA Data Access protocol for retrieving spectral lines coming from various Spectral Line Data Collections.
A SLAP service provides two resources. The /lines resource is dedicated to line retrieval and supports various parameters like wavelength or the considered species. The /species resource returns a list of species for which spectral lines are available.

Both resources return results as a VOTable.

## Status

This is version 2.0 of the SLAP protocol.

The current version is **[WD-SLAP-2.0-20261007](https://www.ivoa.net/documents/SLAP/20261007/)**.


## Building the document

To build a PDF version of this document, you will need a reasonably
complete LaTeX installation, a sufficiently capable `make`, preferably
[latexmk](https://personal.psu.edu/~jcc8/software/latexmk/) and probably
[rsvg-convert](https://wiki.gnome.org/Projects/LibRsvg). For further
details, see [ivoatexDoc](https://ivoa.net/documents/Notes/IVOATex/).

Clone the repository with the ivoatex submodule:

```bash
git clone --recurse-submodules https://github.com/ivoa-std/SLAP2.git
cd SLAP2
make
```

## License

This document is distributed under CC-BY-SA.
