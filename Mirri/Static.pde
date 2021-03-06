class Static extends Application{

    Static(String appName, float x, float y, int dx, int dy){
        super(appName, x, y, dx, dy);
    }

    public void setTimerText(String s){
      ArrayList<Button> button = getAllButtons();
      for(Button b : button){
        if(getApplicationName().equals("timerStarted") && b.getImageValue().equals("displayBox")){
          b.setDisplayText(s);
        }
      }
    }

    public void applicationMouseClicked(int x, int y){
      for(Button b : buttons){
        if(b.isButtonSelected() && b.wasButtonClicked(x, y)){
          b.setButtonSelected(false);
        } else if(b.wasButtonClicked(x, y)){
          b.setButtonSelected(true);
          buttonClicked = true;
          setClickedApp(b.imageValue);
          setClickedApp(getApplicationName());
          if(getApplicationName().equals("loginCalendar") && isAppVisible()){
            return true;
          }
          if(b.getImageValue().equals("clearmode")){
            console.log("clear mode button activate");
          }
        }
        else{
            buttonClicked = false;
            //b.setButtonSelected(false);
            setClickedApp("");
        }
      }
    }
}
