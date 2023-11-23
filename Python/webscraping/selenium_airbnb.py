# CARREGANDO AS BIBLIOTECAS E O MÓDULO
import requests
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from time import sleep
import pandas as pd

# ABRINDO A ABA DE NAVEGAÇÃO DO GOOGLE CHROME
options = Options()
# não mostra o navegador aberto
# options.add_argument('--headless')
options.add_argument('window-size=400,800')
navegador = webdriver.Chrome(options=options)

navegador.get('https://www.airbnb.com.br/')

# ESPERANDO PARA A PÁGINA CARREGAR COMPLETAMENTE
sleep(2)

# CLICLANDO NO BOTÃO DO BUSCADOR
navegador.find_elements_by_xpath('/html/body/div[5]/div/div/div[1]/div/div[3]/div/div[1]/div[1]/div[1]/div/div[1]/div/div/div/div[1]/div/button')[0].click()

# ESPERANDO A PÁGINA CARREGAR
sleep(1.5)

# SALVANDO O ELEMENTO INPUT E ENVIANDO O TEXTO
elemento = navegador.find_elements_by_xpath('//*[@id="/homes-1-input"]')[0]
elemento.send_keys('Rio de Janeiro')
elemento.submit()

# CLICANDO NOS BOTÕES DE OPÇÕES DO CLIENTE (DATA, NÚMERO DE ADULTOS E CRIANÇAS, ETC)
# SELECIONANDO AS DATAS
navegador.find_elements_by_xpath('//*[@id="micro-flex-chips"]/div[2]/div[2]/label')[0].click()

sleep(0.5)

# BOTÃO DE PRÓXIMO
navegador.find_elements_by_xpath('//*[@id="accordion-body-/homes-2"]/section/div/footer/button[2]/div')[0].click()

sleep(0.5)

# DEFININDO O NÚMERO DE ADULTOS
navegador.find_elements_by_xpath('//*[@id="stepper-adults"]/button[2]/span')[0].click()

sleep(0.5)

# BOTÃO DE PESQUISAR
navegador.find_elements_by_xpath('//*[@id="vertical-tabs"]/div[3]/footer/button[2]/span[1]/span')[0].click()

# RECEBENDO O CÓDIGO FONTE DA PÁGINA E CONVERTENDO EM HTML
page_content = navegador.page_source
site = BeautifulSoup(page_content, 'html.parser')



# ESTRUTURA DE REPETIÇÃO 'WHILE' PARA FAZER A ESTRAÇÃO DA PÁGINA
while True:

    rooms = site.findAll('div',attrs={'class':"c4mnd7m dir dir-ltr"})

    for room in rooms:
    
        try:
    
            nome = room.find('span',attrs={'class':'t6mzqp7 dir dir-ltr'})
            n_cama = room.find('span',attrs={'class':'dir dir-ltr'})
            preco = room.find('span',attrs={'class': '_tyxjp1'})
            rating =  room.find('span', attrs={'class':'r1dxllyb dir dir-ltr'})
    
    
            # PRINTANDO OS TEXTOS ENCONTRADOS
            print(nome.text)
            print(n_cama.text)
    
            # CHECANDO SE OS CAMPOS ESTÃO VAZIOS
            # PREÇO
            if (preco):
                preco = preco
        
                print(preco.text)
    
            # RATING
            if (rating):
                rating = rating
        
                print(rating.text)
        
        except:
            print(f"Erro ao obter informações: {e}")
        
        
        
    # Vamos usar a estrutura try/except para apertar o botão de troca de página. Caso que não tenha mais como passar de página,
    # ele vai passar para o próximo no laço. 
    try:
        next_button = navegador.find_elements_by_xpath('//*[@id="site-content"]/div/div[2]/div/div/div/div[2]')[0]
        next_button.click()
        sleep(2) # ESPERA PARA A PRÓXIMA PÁGINA CARREGAR COMPLETAMENTE
    except:
        print(f"Não há mais páginas disponíveis. Encerrando o processo.")
        exit()