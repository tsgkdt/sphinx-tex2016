FROM ubuntu:16.10

ENV LIBRARY_PATH=/lib:/usr/lib
#PlantUML
ENV PLANTUML_DIR /usr/local/plantuml
ENV PLANTUML_JAR plantuml.jar
ENV PLANTUML $PLANTUML_DIR/$PLANTUML_JAR

RUN apt-get update && apt-get -y install texlive-full python3 python3-pip wget openjdk-8-jre graphviz ttf-mscorefonts-installer && \
    #PlantUML
    mkdir $PLANTUML_DIR && \
    wget "https://sourceforge.net/projects/plantuml/files/plantuml.jar" --no-check-certificate && \
    mv plantuml.jar $PLANTUML_DIR && \
    #TakaoFont for Japanese
    wget "https://launchpad.net/takao-fonts/trunk/15.03/+download/TakaoFonts_00303.01.tar.xz" && \
    tar xvf TakaoFonts_00303.01.tar.xz -C /usr/share/fonts/ && \
    rm -f TakaoFonts_00303.01.tar.xz && \
    ln -s /usr/share/fonts/TakaoFonts_00303.01 /usr/share/fonts/TakaoFonts && \
    #Upgrade pip
    pip3 install --upgrade pip && \
    #Install Sphinx with Nice Theme&Extention
    pip3 install -U \
    sphinx \
    sphinxcontrib-blockdiag \
    sphinxcontrib-actdiag \
    sphinxcontrib-nwdiag \
    sphinxcontrib-seqdiag \
    sphinxcontrib-plantuml && \
    apt-get clean

CMD ["python3"]
