# ivoatex Makefile.  See http://ivoa.net/documents/notes/IVOATexDoc
# for the targets available.

# short name of your document (edit $DOCNAME.tex; would be like RegTAP)
DOCNAME = SLAP2

# count up; you probably do not want to bother with versions <1.0
DOCVERSION = 2.0

# Publication date, ISO format; update manually for "releases"
DOCDATE = 2026-03-12

# What is it you're writing: NOTE, WD, PR, REC, PEN, or EN
DOCTYPE = WD

# An e-mail address of the person doing the submission to the document
# repository (can be empty until a make upload is being made)
AUTHOR_EMAIL=nicolas.moreau@obspm.fr

# Source files for the TeX document (but the main file must always
# be called $(DOCNAME).tex)
SOURCES = $(DOCNAME).tex gitmeta.tex role_diagram.pdf

# List of image files to be included in submitted package (anything that
# can be rendered directly by common web browsers)
FIGURES = role_diagram.svg

# List of PDF figures (figures that must be converted to pixel images to
# work in web browsers).
VECTORFIGURES =

# Additional files to distribute (e.g., CSS, schema files, examples...)
AUX_FILES = vosi-capabilities.xml, lines-response-example.vot

-include ivoatex/Makefile

ivoatex/Makefile:
	@echo "*** ivoatex submodule not found.  Initialising submodules."
	@echo
	git submodule update --init

STILTS ?= stilts

registry-sample.xml:
	curl "http://dc.g-vo.org/oai.xml?verb=GetRecord&metadataPrefix=ivo_vor&identifier=ivo://org.gavo.dc/toss/q/q" \
		| xmlstarlet sel --indent -N ri=http://www.ivoa.net/xml/RegistryInterface/v1.0 -t -c //ri:Resource \
		| xmlstarlet fo > $@


test:
	@$(STILTS) xsdvalidate \
		schemaloc="http://www.ivoa.net/xml/VOSICapabilities/v1.0=http://www.ivoa.net/xml/VOSICapabilities/v1.0 http://www.ivoa.net/xml/VODataService/v1.1=http://www.ivoa.net/xml/VODataService/v1.1" \
		vosi-capabilities.xml
	@$(STILTS) xsdvalidate \
		schemaloc="http://www.ivoa.net/xml/VOTable/v1.3=http://www.ivoa.net/xml/VOTable/v1.3" \
		lines-response-example.vot
	@$(STILTS) xsdvalidate \
		schemaloc="http://www.ivoa.net/xml/VODataService/v1.1=http://docs.g-vo.org/schemata/VODataService.xsd http://www.ivoa.net/xml/SLAP/v1.0=SLAP-v1.2.xsd" \
		registry-sample.xml
