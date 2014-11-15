# MOD IMPORTS
#-------------
import mods.tconstruct.Smeltery;

# COMMON VARIABLES
#------------------
var torchWood       = <minecraft:torch>;
var torchCarpenters = <CarpentersBlocks:blockCarpentersTorch>;
var torchStone      = <TConstruct:decoration.stonetorch>;

var bread           = <minecraft:bread>;
var clayBall        = <minecraft:clay_ball>;
var clayBlock       = <minecraft:clay>;
var bucket          = <minecraft:bucket>;
var flint           = <minecraft:flint>;
var flintNSteel     = <minecraft:flint_and_steel>;
var anvil           = <minecraft:anvil>;
var steelIngot      = <ore:ingotSteel>;
var steelBlock      = <ore:blockSteel>;
var flour           = <ore:dustWheat>;
var milk            = <ore:listAllmilk>;
var sugar           = <ore:Sugar>;
var egg             = <ore:listAllegg>;
var cake            = <minecraft:cake>;

var moltenSteel     = <liquid:steel.molten>;

# ORE DICTIONARY
#----------------
var anyTorch = <ore:anyTorch>;
anyTorch.add(torchWood);
anyTorch.add(torchCarpenters);
anyTorch.add(torchStone);

# RECIPE TWEAKS
#----------------

# Bread Requires Cooking Dough
recipes.removeShaped(bread);

# Clay Block -> 4 Clay
recipes.addShapeless(clayBall * 4, [clayBlock]);

# Cake
#-------------------------
# [ Milk,  Milk,  Milk  ]
# [ Sugar, Egg,   Sugar ]
# [ Flour, Flour, Flour ]
# ------------------------
recipes.remove(cake);
recipes.addShaped(cake, [
    [milk,  milk,  milk], 
    [sugar, egg,   sugar], 
    [flour, flour, flour]]);

# Replace Iron With Steel
#-------------------------

# Bucket
recipes.remove(bucket);
Smeltery.addMelting(bucket, moltenSteel * 432, 700, <TConstruct:MetalBlock:9>);
recipes.addShaped(bucket, [
    [steelIngot, null,       steelIngot],
    [null,       steelIngot, null      ]]);

# Flint & Steel
recipes.remove(flintNSteel);
recipes.addShapeless(flintNSteel, [flint, steelIngot]);

# Anvil
recipes.remove(anvil);
recipes.addShaped(anvil, [
    [steelBlock, steelBlock, steelBlock],
    [null,       steelIngot, null      ],
    [steelIngot, steelIngot, steelIngot]]);
