export function cadastrarAdmin(): void {
  const form = document.getElementById("formAdmin") as HTMLFormElement | null;

  if (!form) {
    console.error("Formulário não encontrado!");
    return;
  }

  form.addEventListener("submit", async (event: Event) => {
    event.preventDefault();

    const formData = new FormData(form);
    const data: Record<string, string> = Object.fromEntries(formData.entries()) as Record<string, string>;

    try {
      const response = await fetch("http://localhost:3000/admins", {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify(data)
      });

      if (response.ok) {
        const result: { id: number; nome: string; matricula: string } = await response.json();
        alert(`Administrador cadastrado com ID: ${result.id}`);
      } else {
        const error: string = await response.text();
        alert(`Erro: ${error}`);
      }
    } catch (err) {
      console.error("Erro de rede:", err);
    }
  });
}