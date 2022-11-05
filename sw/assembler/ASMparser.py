import sys


class Parser:
    # DONE
    def __init__(self, inputFile):
        self.file = inputFile  # self.openFile()  # arquivo de leitura
        self.lineNumber = 0  # linha atual do arquivo (nao do codigo gerado)
        self.currentCommand = ""  # comando atual
        self.currentLine = ""  # linha de codigo atual
        self.CommandType = {"A": "A_COMMAND", "C": "C_COMMAND", "L": "L_COMMAND"}
        self.content = self.clear_content()

    # DONE
    def openFile(self):
        try:
            return open(self.inputFile, "r")
        except IOError:
            sys.exit("Erro: inputFile not found: {}".format(self.inputFile))

    # DONE
    def reset(self):
        self.file.seek(0)

    # DONE
    def close(self):
        self.file.close()

    # TODO
    def advanced(self):
        """
        Carrega uma instrução e avança seu apontador interno para o próxima
        linha do arquivo de entrada. Caso não haja mais linhas no arquivo de
        entrada o método retorna "Falso", senão retorna "Verdadeiro".
        @return Verdadeiro se ainda há instruções, Falso se as instruções terminaram.
        """

        if self.lineNumber != len(self.content):
            self.currentCommand = Parser.clear_command(self.content[self.lineNumber])
            while self.currentCommand == [''] or self.currentCommand[0] == ';':
                self.lineNumber += 1
                self.currentCommand = Parser.clear_command(self.content[self.lineNumber])
            self.lineNumber += 1
            return True
        else:
            return False


    # TODO
    def commandType(self):
        """
        Retorna o tipo da instrução passada no argumento:
         - self.commandType['A'] para leaw, por exemplo leaw $1,%A
         - self.commandType['L'] para labels, por exemplo Xyz: , onde Xyz é um símbolo.
         - self.commandType['C'] para todos os outros comandos
        @param  self.currentCommand
        @return o tipo da instrução.
        """
        com = self.currentCommand
        if 'leaw' in com: 
            return self.CommandType['A']
        elif com[0][-1] == ':':
            return self.CommandType['L']
        else: 
            return self.CommandType['C']
        

    # TODO
    def symbol(self):
        """
        Retorna o símbolo ou valor numérico da instrução passada no argumento.
        Deve ser chamado somente quando commandType() é A_COMMAND.
        @param command instrução a ser analisada.
        @return somente o símbolo ou o valor número da instrução.
        """

        com = self.currentCommand
        com[1] = com[1].replace('$','')
        return com[1]


    # TODO
    def label(self):
        """
        Retorna o símbolo da instrução passada no argumento.
        Deve ser chamado somente quando commandType() é L_COMMAND.
        @param command instrução a ser analisada.
        @return o símbolo da instrução (sem os dois pontos).
        """

        com = self.currentCommand
        return com[0].replace(':','')


    # DONE
    def command(self):
        return self.currentCommand

    # DONE
    def instruction(self):
        return self.currentCommand

    def clear_content(self):
        content = self.file.readlines()
        while '\n' in content:
            content.remove('\n')
        return content

    def clear_command(c):
        if c == ['']: 
            return ['']
        else:
            c = c.replace('\n','')
            c = c.replace(',','')
            c = c.split(' ')
            while '' in c:
                c.remove('')
            return c   
