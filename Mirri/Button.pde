

// posX:       starting x position
// posY:       starting y position
// sizeX:    how far is x position extending
// sizeY:    how far is y position extending
class Button {

  private float posX, posY;
  private int sizeX, sizeY;
  private String imageValue;
  private boolean isVisible;
  private boolean isSelected;
  private PImage selectedImage, notSelectedImage;
  private String applicationName;

  Button(String imageVal, float x, float y, int dx, int dy){
    posX = x;
    posY = y;
    sizeX = dx;
    sizeY = dy;
    imageValue = imageVal;
    isSelected = false;
    isVisible = true;
    if(imageVal.equals("calendar")){
    	selectedImage = loadImage("images/" + imageVal + ".png");
    	notSelectedImage = loadImage("images/" + imageVal + ".png");
    } else {
	    selectedImage = loadImage("images/" + imageVal + "_selected.png");
	    notSelectedImage = loadImage("images/" + imageVal + "_notselected.png");
	}
  }

  Button(String imageVal, String appName, float x, float y, int dx, int dy){
    posX = x;
    posY = y;
    sizeX = dx;
    sizeY = dy;
    applicationName = appName;
    imageValue = imageVal;
    isSelected = false;
    isVisible = true;
    if(imageVal.equals("calendar")){
    	selectedImage = loadImage("images/" + imageVal + ".png");
    	notSelectedImage = loadImage("images/" + imageVal + ".png");
    } else {
	    selectedImage = loadImage("images/" + imageVal + "_selected.png");
	    notSelectedImage = loadImage("images/" + imageVal + "_notselected.png");
	}	
  }

  public void setPosX(float x){
    posX = x;
  }

  public void setPosY(float y){
    posY = y;
  }

  public int getSizeX(){
    return sizeX;
  }

  // is button visible to the naked eye on the screen
  private boolean isButtonVisible(){
    return isVisible;
  }

  public boolean setButtonVisibile(boolean val){
    isVisible = val;
  }

  // is button selected
  // different than isVisible, visible only displays the image
  // selected selects the image
  private boolean isButtonSelected(){
    return isSelected;
  }

  public boolean setButtonSelected(boolean val){
    isSelected = val;
  }

  public boolean wasButtonClicked(int x, int y){
    _wasButtonClicked(x,y);
    return isSelected;
  }

  private void _wasButtonClicked(int x, int y){
    int diffX = posX + sizeX;
    int diffY = posY + sizeY;
    if(x > posX && x < diffX){
      if(y > posY && y < diffY){
        setButtonSelected(true);
      }
    }
  }

  public void setButtonSelected(boolean val){
    isSelected = val;
  }

  // gets called if the button is selected
  private void drawButtonSelected(){
    image(selectedImage, posX, posY, sizeX, sizeY);
  }

  // gets called if the button is not selected
  private void drawButtonNotSelected(){
    image(notSelectedImage, posX, posY, sizeX, sizeY);
  }

  public boolean drawButton(){
    if(isButtonVisible() && isButtonSelected()){
      drawButtonSelected();
    } else if(isButtonVisible()){
      drawButtonNotSelected();
    }
  }

}
