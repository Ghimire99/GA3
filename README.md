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

Code to rerun the script:

```bash
# Your command:2: bash scripts/multiqc.sh results/fastqc results/multiqc
```

<!-- No need to paste any output -->


### 13: Differences between the two MultiQC runs

```
*Answer*: Yes, there were differences between the first and second MultiQC runs. In the second run, MultiQC printed a message saying that existing reports were found in the output directory, and it added suffixes (_1) to the new output files:

multiqc_data_1

multiqc_report_1.html

This did not happen in the first run.

The reason for these differences is that both versions of the script (the hard‑coded version and the argument‑accepting version) wrote their results to the same directory, results/multiqc. When MultiQC detects that the directory already contains a previous report, it avoids overwriting those files by automatically adding suffixes to the new ones. This is expected behavior and is caused by running MultiQC twice with the same output directory
```


------------------------------------------------------------------------

## Part D: Pandoc to render Markdown

### 14: The structure of the Pandoc command

*Answer* (options and arguments, and what each does):

*Answer* (how does Pandoc know which output format to produce?):

### 15: Render your README to PDF and HTML

```bash
pandoc -o README.pdf README.md
```

- Command to render to HTML:

```bash
# Your command:
```

### 16: Should the rendered files be committed?

*Answer*: Should the rendered files be committed to your Git repo? Why/why not?

### 17: Install the PDF Viewer extension and view the PDF

*Answer*: One observation about the rendered PDF file:

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

*Answer* (one thing you're confused about):

### 22: Pandoc versions

```bash
# Your command:
```

The output of the command(s) was:

```         
```

*Answer*: Is the Pandoc version available by default the most recent one?

*Answer*: Which Pandoc version are you using after loading the module?