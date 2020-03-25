describe "Segundo Cenario", :dropdown do
    it "visitar página" do
        visit "https://wejump-automation-test.github.io/qa-test/"        
        sleep 5   
        fill_in 'first_name', with:'WebJump'
        click_button 'One'
        select('ExampleTwo', from:'select_box')
        check('OptionThree')        
        page.save_screenshot('./spec/screenshots/screenshot2.png')        
    end 
end