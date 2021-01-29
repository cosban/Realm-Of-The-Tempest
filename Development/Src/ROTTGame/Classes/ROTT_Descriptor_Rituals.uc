/*=============================================================================
 * ROTT_Descriptor_Rituals
 *
 * Author: Otay
 * Bramble Gate Studios (All rights reserved)
 *
 * Stores design information for rituals, such as ritual costs.
 *===========================================================================*/
  
class ROTT_Descriptor_Rituals extends ROTTObject
dependsOn(ROTT_Game_Info)
abstract;

enum RitualTypes {
  RITUAL_EXPERIENCE_BOOST,
  RITUAL_PHYSICAL_DAMAGE,
  RITUAL_MANA_REGEN,
  RITUAL_MANA_BOOST,
  RITUAL_HEALTH_REGEN,
  RITUAL_HEALTH_BOOST,
  RITUAL_ARMOR,
};
  
/*=============================================================================
 * getRitualCost()
 * 
 * returns the price for a shrine ritual
 *===========================================================================*/
public static function array<ItemCost> getRitualCost(RitualTypes ritualType) {
  local array<ItemCost> costList;
  local ItemCost costInfo;
  
  switch (ritualType) {
    case RITUAL_EXPERIENCE_BOOST:
      // Set cost
      costInfo.currencyType = class'ROTT_Inventory_Item_Herb';
      costInfo.quantity = 1;
      
      // Add to list
      costList.addItem(costInfo);
      break;
    case RITUAL_MANA_REGEN:
      // Set cost
      costInfo.currencyType = class'ROTT_Inventory_Item_Bottle_Harrier_Claws';
      costInfo.quantity = 1;
      
      // Add to list
      costList.addItem(costInfo);
      
      // Set cost
      costInfo.currencyType = class'ROTT_Inventory_Item_Charm_Kamita';
      costInfo.quantity = 1;
      
      // Add to list
      costList.addItem(costInfo);
      break;
    case RITUAL_PHYSICAL_DAMAGE:
      // Set cost
      costInfo.currencyType = class'ROTT_Inventory_Item_Charm_Eluvi';
      costInfo.quantity = 1;
      
      // Add to list
      costList.addItem(costInfo);
      
      // Set cost
      costInfo.currencyType = class'ROTT_Inventory_Item_Bottle_Swamp_Husks';
      costInfo.quantity = 1;
      
      // Add to list
      costList.addItem(costInfo);
      break;
  }
  
  // Return list
  return costList;
}

/*=============================================================================
 * getRitualBoost()
 * 
 * returns the amplitude of the boost per ritual performance
 *===========================================================================*/
public static function float getRitualBoost(RitualTypes ritualType) {
  // Return amp by ritual type
  switch (ritualType) {
    case RITUAL_EXPERIENCE_BOOST:  return 1;
    case RITUAL_PHYSICAL_DAMAGE:   return 1;
    case RITUAL_MANA_BOOST:        return 1;
    case RITUAL_MANA_REGEN:        return 1;
    case RITUAL_HEALTH_BOOST:      return 1;
    case RITUAL_HEALTH_REGEN:      return 1;
    case RITUAL_ARMOR:             return 1;
  }
  
  yellowLog("Warning (!) Unhandled ritual type: " $ ritualType);
  return 1;
}

/*=============================================================================
 * descriptors
 *===========================================================================*/
defaultProperties 
{
  
}







