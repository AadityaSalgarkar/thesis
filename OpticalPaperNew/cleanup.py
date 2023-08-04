

"""copy the file regge_1loop.tex in the same directory to ModifiedDocument.tex and replace all \input commands with the respective document,
"""
import os
import re

def mainFunction():
    """main function"""
    with open("regge_1loop.tex", "r") as file:
        content = file.read()
    with open("ModifiedDocument.tex", "w") as file:
        file.write(content)
"""write a function that downloads a .gz source and unzips it , with input being the arxiv id"""
def downloadAndUnzip(arxivID):
    """download and unzip"""
    os.system("wget https://arxiv.org/e-print/" + arxivID)
    os.system("gunzip " + arxivID)



""" expand all the macros of the form \be or \ba or \bea or \beq or \eeq in ModifiedDocument.tex"""
def expand_macros():
    """expand macros"""
    with open("ModifiedDocument.tex", "r") as file:
        content = file.read()
    content = re.sub(r"\\be", r"\\begin{equation}", content)
    content = re.sub(r"\\ba", r"\\begin{align}", content)
    content = re.sub(r"\\bea", r"\\begin{align}", content)
    content = re.sub(r"\\eeq", r"\\end{equation}", content)
    content = re.sub(r"\\ee", r"\\end{equation}", content)
    content = re.sub(r"\\ea", r"\\end{align}", content)
    with open("ModifiedDocument.tex", "w") as file:
        file.write(content)



"""replace all macros in modified document with the respective latex code in dsdshorthand.sty""" 

def replace_macros():
    """replace macros"""
    with open("ModifiedDocument.tex", "r") as file:
        content = file.read()
    with open("dsdshorthand.sty", "r") as file:
        dsdshorthand = file.read()
    macros = re.findall(r"\\newcommand{\\(.*)}", dsdshorthand)
    for macro in macros:
        content = re.sub(r"\\" + macro, dsdshorthand[dsdshorthand.find(r"\\" + macro):], content)
    with open("ModifiedDocument.tex", "w") as file:
        file.write(content)



"""
Change the label of each section and subsection to the camel case version of its name and removing spaces
"""

def change_labels():
    """change labels"""
    with open("ModifiedDocument.tex", "r") as file:
        content = file.read()
    content = re.sub(r"\\section{(.*)}", r"\\section{" + camel_case(r"\1") + "}", content)
    content = re.sub(r"\\subsection{(.*)}", r"\\subsection{" + camel_case(r"\1") + "}", content)
    with open("ModifiedDocument.tex", "w") as file:
        file.write(content)

def camel_case(string):
    """convert string to camel case"""
    string = string.replace(" ", "")
    return string[0].lower() + string[1:]


"""
create a separate empty document tempListOfCitations.tex with all the commands of the form \cite{}
"""

def create_tempListOfCitations():
    """create tempListOfCitations"""
    with open("ModifiedDocument.tex", "r") as file:
        content = file.read()
    citations = re.findall(r"\\cite{(.*)}", content)
    with open("tempListOfCitations.tex", "w") as file:
        for citation in citations:
            file.write(r"\cite{" + citation + "}")



"""compile this file using pdflatex and open the pdf"""

def compile_and_open():
    """compile and open"""
    os.system("pdflatex ModifiedDocument.tex")
    os.system("open ModifiedDocument.pdf")

if __name__ == "__main__":
    downloadAndUnzip("2012.01515")