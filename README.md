# A thesis template to be used for School of Computer Science master students

This is an adaptation of the PhD thesis template, kindly provided by Daniel Sokolowski [in this repository](https://github.com/DSoko2/HSG-thesis/tree/main?tab=readme-ov-file), which itself is an adaptation from the template provided by Krishna Kumar [here](https://github.com/kks32/PhDThesisLyX/). Special thanks should go to Erianne Breu, the administrator of the master, for driving this 'latex thesis template initative' on her end, thus leading to me adapting Daniel Sokolowski's own work.

The adaptations from the PhD template mainly regard the [MasterThesisPSnPDF.cls](MasterThesisPSnPDF.cls) file, where a lot of class options that have to do with printing a PhD thesis were removed, as well as some files that are not needed for a master thesis.

# Using the template

[definitions.tex](definitions.tex) provides the necessary libraries, and if more are needed, they can be added directly there.

[thesis-info.tex](thesis-info.tex) contains all the metadata that describes you, like name, supervisor, submission date etc. The data in this file are read by other files to create the title page and some footnotes.

[thesis.tex](thesis.tex) is the main file that imports all your inputs (like the above 2 files) and compiles the pdf of your thesis work. The chapters, bibliography and any additional overhead should be imported in this main file from files that define (e.g., each chapter, declarations etc.) from the following folders.

📂 **bibliography:** contains the [bibliography.bib](bibliography\bibliography.bib) file for adding your sources.

📂 **content:** here you can add appendices, chapters and the text for your abstract in the respective folders and files.

📂 **graphics:** all your image files go here.

📂 **overhead:** contains the necessary declarations and the acknowledgements for your work. *The **optional** Declaration of Confidentiality is not included in the template*.

# Note on Confidentiality

Most master thesis work is not confidential **and** should be open for everyone to read and get inspired from / generate new ideas based off of your work. **Only if** your work has been done in a context that is strictly confidential, should you add the *Declaration of Confidentiality*. This can be [here](https://universitaetstgallen.sharepoint.com/sites/PruefungenDE/Freigegebene%20Dokumente/Forms/AllItems.aspx?id=%2Fsites%2FPruefungenDE%2FFreigegebene%20Dokumente%2FSchriftliche%20Arbeiten%5FWritten%20examinations%2FTemplate%5FBA%20MA%20Declaration%20of%20Confidentiality%20Bachelor%27s%20thesis%2C%20Master%27s%20thesis%2Epdf&parent=%2Fsites%2FPruefungenDE%2FFreigegebene%20Dokumente%2FSchriftliche%20Arbeiten%5FWritten%20examinations) under the student's web [master thesis page](https://universitaetstgallen.sharepoint.com/sites/PruefungenDE/SitePages/en/Master-Arbeiten.aspx).

### Good luck with your thesis work and all the best!