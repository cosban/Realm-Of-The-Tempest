/*=============================================================================
 * ROTT_UI_Page_Combat_Analysis
 *
 * Author: Otay
 * Bramble Gate Studios (All rights reserved)
 *
 * Description: This page shows the statistics for the heroes performance in 
 * combat.
 *===========================================================================*/
 
class ROTT_UI_Page_Combat_Analysis extends ROTT_UI_Page;

/** ============================== **/

enum ControlState {
  IGNORE_INPUT,
  ACCEPT_INPUT
};

// Menu state
var private ControlState menuControl;

/** ============================== **/

// Input delay timer
var public ROTTTimer inputDelayTimer; 
  
// Internal references
var private ROTT_UI_Displayer_Battle_Analysis analysisInfo;
var private ROTT_UI_Party_Display partyDisplayer;
var private UI_Selector partySelector;

// Parent scene
var private ROTT_UI_Scene_Combat_Results someScene;

/*============================================================================= 
 * initializeComponent
 *
 * Called once, when the scene is first initialized.
 *===========================================================================*/
public function initializeComponent(optional string newTag = "") {
  super.initializeComponent(newTag);
  
  // set parent scene
  someScene = ROTT_UI_Scene_Combat_Results(outer);
  
  // Internal references
  analysisInfo = ROTT_UI_Displayer_Battle_Analysis(findComp("Analysis_Info"));
  partyDisplayer = ROTT_UI_Party_Display(findComp("Party_Displayer"));
  partySelector = UI_Selector(findComp("Hero_Selection_Box"));
}

/*============================================================================= 
 * onPushPageEvent
 *
 * Description: This event is called every time the page is pushed.
 *===========================================================================*/
event onPushPageEvent() {
  // Push transition effect
  someScene.pushPage(someScene.transitionPageIn);
  
  // Ignore input until focused
  menuControl = IGNORE_INPUT;
  
  // Graphics
  partySelector.setActive(true);
  partySelector.resetSelection();
  partyDisplayer.syncIconEffects();
  
  // Display the analysis through refresh
  refresh();
  
}

/*============================================================================= 
 * refresh()
 *
 * This function should ensure that any data thats been changed will be 
 * correctly updated on the UI.
 *===========================================================================*/
public function refresh() {
  local ROTT_Combat_Hero hero;
  
  // Attach hero information
  hero = gameInfo.getActiveParty().getHero(partySelector.getSelection());
  analysisInfo.attachDisplayer(hero);
  
  // Show hero and party info
  analysisInfo.updateDisplay();
  partyDisplayer.renderParty(gameInfo.getActiveParty()); 
}

/*============================================================================= 
 * onSceneActivation
 *
 * Called every time the parent scene is loaded
 *===========================================================================*/
public function onSceneActivation() {
  partyDisplayer.renderParty(gameInfo.getActiveParty()); 
}

/*=============================================================================
 * onFocusMenu()
 *
 * Called when a menu is given focus.  Assign controls, and enable graphics.
 *===========================================================================*/
event onFocusMenu() {
  inputDelayTimer = gameInfo.spawn(class'ROTTTimer');
  inputDelayTimer.makeTimer(0.2, LOOP_OFF, allowInput);
}

/*=============================================================================
 * D-Pad controls
 *===========================================================================*/
public function onNavigateLeft() {
  // Update UI
  refresh();
}

public function onNavigateRight() {
  // Update UI
  refresh();
}

protected function navigateDown();
protected function navigateUp();

/*=============================================================================
 * Button controls
 *===========================================================================*/
protected function navigationRoutineA() {
  exitPage();
}

protected function navigationRoutineB() {
  exitPage();
}

private function exitPage() {
  // Ignore controls before delay completes
  if (menuControl != ACCEPT_INPUT) return;
  
  // Reset encounter state
  gameInfo.bEncounterActive = false;
  gameInfo.getActiveParty().onAnalysisComplete();
  
  // Prevent doubling of transition
  menuControl = IGNORE_INPUT;
  
  if (someScene.bLevelUpTransfer) {
    // Transition to hero stats page
    someScene.transitionToHeroStats();
    someScene.bLootPending = true;
  } else {
    // Push transition effect for over world
    someScene.pushPage(someScene.transitionPageOverWorld);
    gameInfo.sceneManager.sceneOverWorld.fadeIn();
  }
  
  ///playsfx SFX_MENU_ACCEPT SFX_MENU_BACK SFX_MENU_NAVIGATE
  
  // Autosave update
  gameInfo.saveGame(true);
}

/*============================================================================= 
 * allowInput()
 *
 * This function is delegated to a timer, thus no paramaters.
 * Re-enables selection input, and renders selected class info.
 *===========================================================================*/
private function allowInput() { 
  // Allow input
  menuControl = ACCEPT_INPUT;

  // Destroy invoking timer
  if (inputDelayTimer != none) inputDelayTimer.Destroy();
} 

/*=============================================================================
 * Assets
 *===========================================================================*/
defaultProperties
{  
  /** ===== Input ===== **/
  begin object class=ROTT_Input_Handler Name=Input_A
    inputName="XBoxTypeS_A"
    buttonComponent=none
  end object
  inputList.add(Input_A)
  
  begin object class=ROTT_Input_Handler Name=Input_B
    inputName="XBoxTypeS_B"
    buttonComponent=none
  end object
  inputList.add(Input_B)
  
  /** ===== Textures ===== **/
  // Left menu backgrounds
  begin object class=UI_Texture_Info Name=Victory_Background
    componentTextures.add(Texture2D'GUI.Victory_Background_With_Stats')
  end object
  
  /** ===== UI Components ===== **/
  // Background
  begin object class=UI_Sprite Name=Background_Sprite
    tag="Background_Sprite"
    bEnabled=true
    posX=0
    posY=0
    posXEnd=NATIVE_WIDTH
    posYEnd=NATIVE_HEIGHT
    images(0)=Victory_Background
  end object
  componentList.add(Background_Sprite)
  
  // Analysis info
  begin object class=ROTT_UI_Displayer_Battle_Analysis Name=Analysis_Info
    tag="Analysis_Info"
    bEnabled=true
    posy=1
  end object
  componentList.add(Analysis_Info)
  
  // Party Displayer
  begin object class=ROTT_UI_Party_Display Name=Party_Displayer
    tag="Party_Displayer"
    bEnabled=true
    posX=107
    posY=74
    XOffset=200
    YOffset=0
  end object
  componentList.add(Party_Displayer)
  
  
  /** ===== UI Components ===== **/
  // Party Selection Box
  begin object class=UI_Selector Name=Hero_Selection_Box
    tag="Hero_Selection_Box"
    bEnabled=true
    bActive=true
    posX=107
    posY=74
    navigationType=SELECTION_HORIZONTAL
    selectionOffset=(x=200,y=0)
    numberOfMenuOptions=3
    
    // Selection texture
    begin object class=UI_Texture_Info Name=Selection_Box_Texture
      componentTextures.add(Texture2D'GUI.Party_Selection_Box')
    end object

    // Selector sprite
    begin object class=UI_Sprite Name=Selector_Sprite
      tag="Selector_Sprite"
      images(0)=Selection_Box_Texture
      activeEffects.add((effectType=EFFECT_ALPHA_CYCLE, lifeTime=-1, elapsedTime=0, intervalTime=0.4, min=170, max=255))
    end object
    componentList.add(Selector_Sprite)
    
  end object
  componentList.add(Hero_Selection_Box)
}
















