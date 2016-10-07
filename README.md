# infractus
===========

Validate deletions, tandem duplications, and inversions with single-reads

## Installation 
```
git clone --recursive https://github.com/dantaki/infractus
cd infractus
perl INSTALL.pl
```
### Requires

* [Getopt::Long](http://search.cpan.org/~jv/Getopt-Long-2.49.1/lib/Getopt/Long.pm)
* [Statistics::Basic](http://search.cpan.org/~jettero/Statistics-Basic-1.6611/lib/Statistics/Basic.pod)
* [Term::ProgressBar](http://search.cpan.org/~szabgab/Term-ProgressBar-2.17/lib/Term/ProgressBar.pm)

* [samtools](http://www.htslib.org/)

## Usage

```
infractus -b,--bam [BAM] -l,--bed [BED] -c,--cpu [CPU] -f,--flank [FLANKING BP] -q,--qual [MAPPING QUALITY] -s,--span [MINIMUM OVERLAP] -o,--out [OUTPUT] -h,--help [HELP]
```
infractus finds breakpoints in single-read alignments if the reciprocal overlap to the SV in question is >80%. 

BAM files must contain supplementary alignment tags (SA:).

## Options

Option | Description
--- | --- 
-b,--bam | Input BAM file
-l,--bed | Input BED file
-c,--cpu | Threads. Passed to samtools view -@ <cpu>
-f,--flank | Extend positions for split-read search. Default 150bp
-q,--qual | Mapping Quality. Default 20
-s,--span | Minimum reciprocal overlap to input. Default 80%
-o,--out | Output
-h,--help | Help

## Inputs

#### BAM

infractus requires single-read alignments with suppplementary alignments (SA: tag).

`-b,--bam` accepts either a file or a path, where all files that end in `.bam` will be analyzed. 

#### BED

input BED file containing SV to validate must be tab-delimited formatted as 

CHROM | START | END | TYPE
--- | --- | --- | --- 

Acceptable types include

* DEL
* DUP
* INV

## Example

```
infractus --bam NA12878.bam --bed SV.bed -o test.txt 

infractus --bam /home/user/bams/ --bed SV.bed -f 500 -q 10 -s 0.5 # extend search by 500bp, minimum mapping quality 10, and minimum reciprocal overlap 50% 
```

## Author:

* Danny Antaki
  * dantaki@ucsd.edu

### Acknowledgements:

* Jonathan Sebat
   * Sebat Lab http://sebatlab.ucsd.edu

## License 
MIT License

Copyright (c) 2016 Danny Antaki

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


