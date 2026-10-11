<!--
GA3 README template.
- Add your answers to each question's section below.
- For each question where we want you to add your commands,
  put the command(s) you ran in the terminal in the corresponding ```bash code block.
- Where we want to see a command's output, there is a plain ``` code block
  right below the command block: paste the output there.
- You don't need to paste the contents of your scripts into this file:
  we will look at the scripts in your `scripts` dir directly
  (so make sure you commit them!).
- Delete instructional comments like this one as you go.
-->

# GA3 answers - Biswash Ghimire

------------------------------------------------------------------------

## Part A: Your README, data, and Git repo

### 1: Create subdirs and copy files


### 2: Initialize a Git repository, and commit the README and `.gitignore`



### 3: Commit throughout the assignment

<!-- No command/output needed here -- we check your commit history directly. -->

------------------------------------------------------------------------

## Part B: Basic shell scripts

### 4: Predict the output of `echo.sh`

<!-- No need to paste the script: we'll look at scripts/echo.sh directly. -->

*Answer* (prediction and reasoning for `bash scripts/echo.sh Oct07 Oct08`):
```
Oct07
Oct08
scripts/echo.sh: line 6: $3: unbound variable

Only two arguments were provided.
$3 is missing → set -u triggers an error → script stops → “Finished” does not print. 
```


*Answer* (prediction and reasoning for `bash scripts/echo.sh Oct07 Oct08 Oct09 Oct10`):
```
Oct07
Oct08
Oct09
Finished

$1, $2, $3 all exist → no error.
$4 exists but is ignored because the script never prints it.
```
 
*Answer* (prediction and reasoning for `bash scripts/echo.sh Oct07 Oct08 "Oct09 Oct10"`):
``` 
Oct07
Oct08
Oct09 Oct10
Finished

Quotes keep the two words together → "Oct09 Oct10" becomes one argument → $3 is valid.
```

*Answer* (prediction and reasoning for `bash scripts/echo.sh results/fastqc/*.html`):
```
results/fastqc/S63_R1_fastqc.html
results/fastqc/S63_R2_fastqc.html
results/fastqc/S64_R1_fastqc.html
Finished

Globbing expands *.html into all matching filenames before the script runs.
The script prints only $1, $2, $3, so it prints the first three filenames, then “Finished”.
No error occurs because $3 exists.
```

### 5: Run `echo.sh` and compare with your predictions

```bash
bash scripts/echo.sh Oct07 Oct08
```

The output of the command was:

```  
Oct07
Oct08
scripts/echo.sh: line 6: $3: unbound variable       
```

```bash
bash scripts/echo.sh Oct07 Oct08 Oct09 Oct10
```

The output of the command was:

``` 
Oct07
Oct08
Oct09
Finished        
```

```bash
bash scripts/echo.sh Oct07 Oct08 "Oct09 Oct10"
```

The output of the command was:

```    
Oct07
Oct08
Oct09 Oct10
Finished 
```

```bash
bash scripts/echo.sh results/fastqc/*.html
```

The output of the command was:

``` 
results/fastqc/S63_R1_fastqc.html
results/fastqc/S63_R2_fastqc.html
results/fastqc/S64_R1_fastqc.html
Finished       
```

*Answer*: Which output (if any) differed from your prediction, and why?
```
None of the outputs differed from my predictions.
All four commands behaved exactly as expected based on how Bash handles positional parameters, quoting, and glob expansion.
```

### 6: Write the `printline.sh` script

<!-- No need to paste the script: we'll look at scripts/printline.sh directly. -->

### 7: Test `printline.sh` twice

Test 1:

```bash
# Your command:
bash scripts/printline.sh data/metadata.tsv 5
```

```
The output of the command was:

S83     10dpi   cathemerium
```

Test 2 (with redirection), and checking the contents of the output file:

```bash
# Your command:
bash scripts/printline.sh data/metadata.tsv 10 > results/line10.txt
cat results/line10.txt
```

The output of the command that checks the file contents was:

```   
S76     10dpi   relictum    
```

------------------------------------------------------------------------

## Part C: A script to run MultiQC

### 8: Get a MultiQC container link

*Answer*: The container link (URI) is: community.wave.oras://community.wave.seqera.io/library/multiqc:1.35--562c547b518ebe20


### 9: MultiQC's help info, and the MultiQC command

Code to run `multiqc --help` with the container:

```bash
# Your command: apptainer exec oras://community.wave.seqera.io/library/multiqc:1.35--562c547b518ebe20 multiqc --help
```


<!-- You don't need to paste the MultiQC help output -->

The MultiQC command to run MultiQC on `results/fastqc` with output in `results/multiqc`:

```bash
# Your command: multiqc results/fastqc -o results/multiqc
```

### 10: Write the `multiqc.sh` script

<!-- No need to paste the script: we'll look at scripts/multiqc.sh directly. -->

### 11: Run `multiqc.sh`

Code to run the script: bash scripts/multiqc.sh 

```bash
# Your command:bash scripts/multiqc.sh results/fastqc results/multiqc
```

<!-- You don't need to paste the MultiQC logging output -->

*Answer*: Number of FastQC reports MultiQC found:44

*Answer*: Does that match what you expected? Why/why not?

``` Y
Yes, it matches what I expected. I previously ran FastQC on 44 FASTQ files, so I expected MultiQC to find 44 FastQC reports. MultiQC confirmed this by reporting “Found 44 reports,” which means all FastQC outputs were present and successfully detected.
```



### 12: Make `multiqc.sh` accept arguments, and rerun it

<!-- No need to paste the script: we'll look at scripts/multiqc.sh and its Git history directly. -->

Code to rerun the script: bash scripts/multiqc.sh results/fastqc results/multiqc


```bash
# Your command:2: bash scripts/multiqc.sh results/fastqc results/multiqc
```

<!-- No need to paste any output -->


### 13: Differences between the two MultiQC runs

```
*Answer*: 
Yes, there were differences between the first and second MultiQC runs.
In the second run, MultiQC printed an extra message saying that existing reports were found in the output directory and that it would add suffixes to avoid overwriting. This message did not appear in the first run.

It also added suffixes (_1) to the new output files:

multiqc_data_1

multiqc_report_1.html

This did not happen in the first run.

The reason for these differences is that both versions of the script (the hard‑coded version and the argument‑accepting version) wrote their results to the same directory, results/multiqc. When MultiQC detects that the directory already contains a previous report, it avoids overwriting those files by automatically adding suffixes to the new ones. This is expected behavior and is caused by running MultiQC twice with the same output directory.
```


------------------------------------------------------------------------

## Part D: Pandoc to render Markdown

### 14: The structure of the Pandoc command

*Answer* (options and arguments, and what each does):The command pandoc -o README.pdf README.md consists of the program name (pandoc), one option (-o), the option’s argument (README.pdf), and one positional argument (README.md).

*Answer* (how does Pandoc know which output format to produce?):  The -o option tells Pandoc where to write the output. Pandoc knows to produce a PDF because the output file name ends in .pdf.

### 15: Render your README to PDF and HTML

```bash
pandoc -o README.pdf README.md
```

- Command to render to HTML:

```bash
# Your command:pandoc -o README.html README.md

```

### 16: Should the rendered files be committed?

*Answer*: Should the rendered files be committed to your Git repo? Why/why not? 
No. Rendered files like PDF and HTML are build artifacts that can be regenerated at any time from the Markdown source. They don’t belong in version control and would create unnecessary, noisy commits.

### 17: Install the PDF Viewer extension and view the PDF

*Answer*: One observation about the rendered PDF file:
When I opened the rendered README.pdf in VS Code using the PDF Viewer extension, I noticed that the headings were larger and more spaced out than they appear in the Markdown preview. The PDF also added extra spacing before code blocks, which I had expected.

## Part E: Publish your repo on GitHub

### 18: Create a GitHub repository

<!-- No command/output needed here -- we check your GitHub repo directly. -->

### 19: Connect your local repo to GitHub, and push

<!-- No command/output needed here -- we check your GitHub repo directly. -->

### 20: Create an Issue to tag the instructors

<!-- No command/output needed here -- we check your GitHub repo directly. -->

------------------------------------------------------------------------

## Bonus

### 21: Explore the MultiQC report

*Answer* (one insight you gained):  
From exploring the MultiQC report, I noticed that the per‑base sequence quality plots look very similar to the FastQC plots we learned about in Week 07. Most samples show high quality scores across all positions, which matches the “good” quality profile described in the lecture. MultiQC makes this easier to see because all samples are plotted together, and hovering over each line shows the sample ID. This helped me quickly confirm that the majority of samples have consistently strong sequencing quality.

*Answer* (one thing you're confused about):  
One thing I’m still unsure about is how MultiQC decides which FastQC warnings to display or emphasize. In Week 07, we learned how FastQC assigns PASS/WARN/FAIL statuses for modules like adapter content, GC content, and overrepresented sequences. But in MultiQC, some warnings seem more prominent than others, and I’m not completely sure how MultiQC aggregates or prioritizes these FastQC flags. I would like to learn more about how MultiQC summarizes these results and how it decides what to highlight.

### 22: Pandoc versions

```bash
# Your command:
pandoc -v

```

The output of the command(s) was:

```  pandoc 2.14.0.3
Compiled with pandoc-types 1.22.1, texmath 0.12.3.3, skylighting 0.10.5.2,
citeproc 0.4.0.1, ipynb 0.1.0.1
User data directory: /users/PAS3493/ghimire75/.local/share/pandoc
Copyright (C) 2006-2021 John MacFarlane.

```

*Answer*: Is the Pandoc version available by default the most recent one?  
No.
The default version on OSC is Pandoc 2.14.0.3, which is from 2021.
The most recent releases are in the Pandoc 3.x series, so the default version is not the newest.

*Answer*: Which Pandoc version are you using after loading the module?  
I am using Pandoc 3.6.4 after loading the module.