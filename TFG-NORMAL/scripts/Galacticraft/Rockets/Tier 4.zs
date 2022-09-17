import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;

val RocketT4 as IItemStack[] = [
  <extraplanets:item_tier4_rocket>,
  <extraplanets:item_tier4_rocket:1>,
  <extraplanets:item_tier4_rocket:2>,
  <extraplanets:item_tier4_rocket:3>,
];
val CrateT4 as IItemStack[] = [
  <metaitem:plateAluminium>,
  <metaitem:crate.aluminium>,
  <metaitem:crate.stainless_steel>,
  <metaitem:crate.titanium>
];
for i, RocketT4 in RocketT4 {
// Tier 4 - Ракета
assembly_line.recipeBuilder()
  .inputs(<extraplanets:nose_cone_tier4>) // Обтекатель
  .inputs(<metaitem:rocket.body.tier.4> * 12) // Корпус
  .inputs(<extraplanets:tier4_items:2> * 6)  // Стабилизаторы
  .inputs(<extraplanets:tier4_items:1> * 4) // Ускорители
  .inputs(<extraplanets:tier4_items> * 2) // Двигатели
  .inputs(<galacticraftcore:oil_canister_partial:1001> * 16)
  .inputs(<metaitem:lander.tier.3>)
  .inputs(<metaitem:electric.motor.luv> * 4)
  .inputs(<metaitem:emitter.luv> * 4)
  .inputs(<ore:circuitLuv> * 8)
  .inputs([CrateT4[i] * 12])
  .inputs(<metaitem:rocket.control.computer.tier.4>)
  .inputs(<extraplanets:schematic_tier4>)
  .fluidInputs([<liquid:dense_ice> * 9216])
  .fluidInputs([<liquid:soldering_alloy> * 4608])
  .fluidInputs([<liquid:ruridit> * 4608])
  .outputs([RocketT4])
  .duration(1200).EUt(30720).buildAndRegister();
}
// Ракетный компьютер
assembler.recipeBuilder()
  .circuit(4)
  .inputs([
    <opencomputers:case2>,
    <opencomputers:keyboard>,
    <opencomputers:screen2>,
    <metaitem:emitter.luv>,
    <metaitem:sensor.luv>,
    <extraplanets:tier4_items:3>])
  .fluidInputs([<liquid:soldering_alloy> * 1728])
  .outputs(<metaitem:rocket.control.computer.tier.4>)
  .property("cleanroom", "cleanroom")
  .duration(600).EUt(30720).buildAndRegister();
// Головоной обтекатель
assembler.recipeBuilder()
  .circuit(4)
  .inputs([
    <galacticraftplanets:heavy_nose_cone>,
    <extraplanets:tier4_items:3> * 4,
    <metaitem:sensor.luv> * 2,
    <ore:screwTungstenSteel> * 4])
  .fluidInputs([<liquid:soldering_alloy> * 288])
  .outputs(<extraplanets:nose_cone_tier4>)
  .property("cleanroom", "cleanroom")
  .duration(600).EUt(30720).buildAndRegister();
// Корпус
assembler.recipeBuilder()
  .circuit(4)
  .inputs([
    <extraplanets:tier4_items:3> * 2,
    <metaitem:voltage_coil.luv> * 2,
    <metaitem:field.generator.luv>])
  .fluidInputs([<liquid:soldering_alloy> * 288])
  .outputs(<metaitem:rocket.body.tier.4>)
  .property("cleanroom", "cleanroom")
  .duration(300).EUt(30720).buildAndRegister();
// Стабилизаторы
assembler.recipeBuilder()
  .circuit(4)
  .inputs([
    <extraplanets:tier4_items:3> * 2,
    <galacticraftplanets:item_basic_asteroids:5> * 2,
    <ore:screwRuridit> * 4])
  .fluidInputs([<liquid:soldering_alloy> * 288])
  .outputs(<extraplanets:tier4_items:2>)
  .property("cleanroom", "cleanroom")
  .duration(300).EUt(30720).buildAndRegister();
// Ракетные двигатели
assembler.recipeBuilder()
  .circuit(4)
  .inputs([
    <extraplanets:tier4_items:3> * 5,
    <galacticraftplanets:item_basic_asteroids:1> * 2,
    <galacticraftcore:engine:1> * 2,
    <metaitem:electric.pump.luv> * 4,
    <ore:cableGtSingleAnnealedCopper> * 16])
  .fluidInputs([<liquid:soldering_alloy> * 288])
  .outputs(<extraplanets:tier4_items>)
  .duration(300).EUt(30720).buildAndRegister();
// Ускорители
assembler.recipeBuilder()
  .circuit(4)
  .inputs([
    <galacticraftcore:engine:1>,
    <extraplanets:tier4_items:3> * 4,
    <ore:plateDenseIce> * 3])
  .fluidInputs([<liquid:soldering_alloy> * 288])
  .outputs(<extraplanets:tier4_items:1>)
  .property("cleanroom", "cleanroom")
  .duration(600).EUt(30720).buildAndRegister();
// Сплав сверх-прочных пластин
assembly_line.recipeBuilder()
  .inputs([
    <galacticraftplanets:item_basic_asteroids:5>,
    <ore:plateDenseIce> * 3,
    <ore:plateDenseIce> * 3,
    <ore:boltRuridit> * 4])
  .fluidInputs([<liquid:soldering_alloy> * 36])
  .outputs(<metaitem:alloy.ingot.tier.4>)
  .duration(300).EUt(30720).buildAndRegister();
// Сверх-прочные пластины
implosion_compressor.recipeBuilder()
	.inputs([<metaitem:alloy.ingot.tier.4>])
	.outputs(
      <extraplanets:tier4_items:3>,
      <metaitem:dustTinyRuridit> * 4)
	.property("explosives", <minecraft:tnt> | <metaitem:dynamite> * 24)
	.duration(20).EUt(30).buildAndRegister();
// Схема ракеты
laser_engraver.recipeBuilder()
	.inputs([<metaitem:schematic.blank>])
  .notConsumable([<metaitem:glass_lens.light_blue>])
	.outputs(<extraplanets:schematic_tier4>)
  .property("cleanroom", "cleanroom")
	.duration(9000).EUt(30720).buildAndRegister();