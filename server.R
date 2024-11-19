server <- function(input, output) {
  
  parametros <- eventReactive(input$go_button,
                              {
                                c(
                                  input$parametro_1,
                                  1 -input$parametro_1,
                                  input$parametro_2,
                                  1 -input$parametro_2
                                )
                              })
  
  bens_1 <- eventReactive(input$go_button,{
    c(as.numeric(input$qntd_11),
      as.numeric(input$qntd_12)
    )
  })
  
  bens_2 <- eventReactive(input$go_button,{
    c(as.numeric(input$qntd_21),
      as.numeric(input$qntd_22)
    )
  })
  
  box <- eventReactive(input$go_button, {
    box <- Edgeworth(E_h = bens_1(), 
                     E_f = bens_2(), 
                     alpha = parametros()[1],
                     beta = parametros()[3])
  })
  
  output$caixa <- renderPlot({
    
    plot(box()$p)
  })
  
  output$tabela <- renderTable({
    solution1 <- rbind(bens_1(), box()$Home.Consumption, 
                       bens_2(), box()$Foreign.Consumption, 
                       box()$Terms.of.Trade)
    categorias<- c('Renda do Indivíduo 1', 'Consumo do Indivíduo 1', 
                   'Renda do Indivíduo 2', 'Consumo do Indivíduo 2',
                   'Termos de Trocas (Preços)') 
    solution1 <- cbind(solution1,categorias)
    colnames(solution1) <- c('Bem 1', 'Bem 2',' ')
    
    as_tibble(solution1) |> 
      select(' ','Bem 1', 'Bem 2') |> 
      mutate(across(2:3,~round(as.numeric(.), 2)) )
  },width = '100%')
  
  
  output$utilidades <- renderPlot({
    
    plot(
      TeX(
        paste0('$U_{1}(x,y) = x^{',parametros()[1],'}y^{',parametros()[2],'} \\ U_{2}(x,y) = x^{',parametros()[3],'}y^{',parametros()[4],'}$'),
        italic = T
      ), cex = 1.8
    )
  },height = 250)
}