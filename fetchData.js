import supabase from "./supabaseClient.js";

const { data, error } = await supabase
  .from("bloco")
  .select();

console.log({ data, error });