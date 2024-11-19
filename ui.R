ui <- dashboardPage(
  dashboardHeader(title = "Equilíbrio Geral"),
  dashboardSidebar(disable = T),
  dashboardBody(
    fluidRow(
      box(plotOutput("caixa",
                     fill = T), 
          height = 450,
          title = 'Caixa de Edgeworth'),
      
      box(
        title = "Parâmetros do Problema",
        fluidRow(
          column(6,sliderInput("parametro_1", 
                               "Proporção do primeiro bem do Indivíduo 1", 
                               min = 0,
                               max = 1,
                               100)),
          column(6,sliderInput("parametro_2",
                               "Proporção do primeiro bem do Indivíduo 2",
                               min = 0,
                               max = 1,
                               100))
        ),
        fluidRow(
          column(6,textInput('qntd_11',
                             label = 'Quantidade bem 1 do indivíduo 1',
                             value = 10)),
          column(6,textInput('qntd_21',
                             label = 'Quantidade bem 2 do indivíduo 1',
                             value = 0))
          
        ),
        fluidRow(column(6,
                        textInput('qntd_12',
                                  label = 'Quantidade bem 1 do indivíduo 2',
                                  value = 0)
        ),
        column(6,
               textInput('qntd_22',
                         label = 'Quantidade bem 2 do indivíduo 2',
                         value = 10)
        )
        ),
        actionButton(inputId = 'go_button',
                     label = 'Atualizar'), height = 450
        
      )
    ),
    fluidRow(
      box(tableOutput('tabela'),
          title = 'Tabela de Resultados',height = 300),
      box(plotOutput('utilidades',fill = T),
          title = 'Funções de Utilidade',height = 300)
    )
  )
)