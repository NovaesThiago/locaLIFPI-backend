import supabase from "./supabaseClient.js";

const { data, error } = await supabase
  .from("bloco")
  .delete()
  .eq("bloco_id", 2)
  .select();

console.log({ data, error });