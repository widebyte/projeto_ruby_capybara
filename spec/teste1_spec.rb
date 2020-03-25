describe "Primeiro Cenario" do
    it "visitar página" do
        visit "https://wejump-automation-test.github.io/qa-test/"        
        sleep 5   
        click_button 'One'
        sleep 1
        click_button 'Two'
        sleep 1
        click_button 'Four'
        page.save_screenshot('./spec/screenshots/screenshot.png')        
    end 
end


