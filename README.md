# SortieAnalysis

# READ ME

This document describes the folder structure of SortieND-Output-Analysis. This folder is the dedicated workspace for analyzing SORTIE-ND outputs. The parameter files are not stored here, but can be accessed at the [SortieRuns repository](https://www.github.com/ecology-rocks/SortieRuns). You can learn about how to create new .Rnw / PDF files on the SortieAnalysis [wiki](https://github.com/ecology-rocks/SortieAnalysis/wiki).

## How To Use This Folder

This folder is organized by date and then model run. To access the most recent model run's summary, simply click on the folder with the latest date (currently 081815-Sweave) and view the PDF file found in that directory. All of the data used to generate the Sweave file are also located in these folders, so that you can re-run the analyses or play around if necessary. See below for details.

## File Structure

The folder is broken into Sweave folders that contain individual sweave files (.Rnw) and their resulting PDF files (.pdf) that organize and report the model results for a given model run. Models are labeled in the general date (MMDDYYYY)-run(_a-z) format; e.g., 080815-summary vs 080815a-summary or 080815z-summary. The first run of a given day does not have a letter prefix.

Under each Sweave folder, there will be summary files and an outfiles folder that contains the original data (.out files) as well as summary files for the entire run (datetag-adultba.csv) and individual plots (in "means" subfolder). See the folder structure described below, as well as how the code in the Rnw files generates PDFs for a feel of the file structure. The outfiles (.out) are NOT uploaded with SortieAnalysis. You must choose the correct ones and place them where they belong from the SortieRuns repo ([SortieRuns](https://www.github.com/ecology-rocks/SortieRuns)).


(SortieND-Output-Analysis)

| README.md -- This file

| SortieOutputRuns.Rproj -- RStudio project file, 

| (0x0x15-Sweave) -- folder

| | 0x0x15x-summary.Rnw -- the Sweave file used to generate the pdf

| | 0x0x15x-summary.pdf -- a summary document of that particular model run

| | (outfiles) -- folder

| | | (orig / a / b ... / z) -- folder

| | | | 0x0x15x-adultba.csv -- summary for entire model run by step/species

| | | | 0x0x15x-adultdensity.csv -- summary for entire model run by step/species

| | | | 0x0x15-SITE\_RUN.out (e.g., 081515-BBBPIPO\_1.out) -- orig SORTIE outputs

| | | | (means) -- folder

| | | | | SITE-AdultAbsBA.csv (e.g., BBBPIPO-AdultAbsBA.csv) -- site summaries

| | | | | SITE-AdultAbsDen.csv -- site summaries

## What Is Sweave?

Sweave is a dynamic document generator. It interprets documents that have "chunks" in two different languages: R, and LaTeX. R is a statistical programming language. LaTeX is a document formatting language. Sweave interprets these together to generate PDF files that are reproducible, e.g., should run on every platform. You can run Sweave in RStudio or directly in R. You can view more information [here](http://www.math.montana.edu/~jimrc/classes/Rseminar/SweaveIntro.html).

### End Matter

This file is written in basic Markdown. Created on 09/10/2015 by Sam Davis. Updated on 11/10/15 by Sam Davis.