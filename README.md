🚦 Cyclic Lamp FSM (Verilog)

A simple Finite State Machine (FSM) implemented in Verilog that controls a cyclic lamp with three states: GREEN → YELLOW → RED.

This project demonstrates FSM design, state encoding, and synthesis behavior in hardware description languages.

📁 Project Structure
Cyclic_Lamp/
  src/
     └── Cyclic_lamp.v        // Main FSM design
  tb/
     └── Cyclic_lamp_TB.v     // Testbench for simulation

🧠 FSM Description
State Sequence
S0 (GREEN) → S1 (YELLOW) → S2 (RED) → back to S0

Output Encoding
Light	Code
RED	3'b100
GREEN	3'b010
YELLOW	3'b001
State Diagram
     +-----------+
     |   S0      |
     |  GREEN    |
     +-----+-----+
           |
           v
     +-----------+
     |   S1      |
     | YELLOW    |
     +-----+-----+
           |
           v
     +-----------+
     |   S2      |
     |   RED     |
     +-----+-----+
           |
           +----> back to S0

🧩 Synthesis Result Explanation
Using a Single Always Block

Both state and light are updated inside:

always @(posedge clk)


Therefore, the synthesis tool creates:

2 flip-flops → for state (2-bit register)

3 flip-flops → for light output (3-bit register)

✔ Total = 5 Flip-Flops
Using Two Always Blocks (Recommended FSM Style)

1️⃣ Sequential Block (State Register)
2️⃣ Combinational Block (Output Logic)

Outputs become combinational, so light does NOT need flip-flops.

✔ Total Flip-Flops = 2
# Verilog
FSM Based verilog coding
Cyclic_lamp
  src/
     └── Cyclic_lamp.v        // Main FSM design
  tb/
     └── Cyclic_lamp_TB.v     // Testbench for simulation

=> Using one always block makes both state and output registered.
   So synthesis tool creates 2 FFs for state + 3 FFs for light = 5 FFs.

=> Using two always blocks (state register + combinational output logic) keeps output combinational.
   So only 2 FFs are needed (for state).

 <img width="1067" height="643" alt="image" src="https://github.com/user-attachments/assets/2fd6dee2-f018-45c9-a089-bed9bd0616d6" />
 

<img width="1491" height="228" alt="Screenshot 2025-12-02 095930" src="https://github.com/user-attachments/assets/99782560-0116-4d68-9a7e-9733b21cb7bc" />


<img width="1044" height="349" alt="Screenshot 2025-12-02 095955" src="https://github.com/user-attachments/assets/8cbabd9e-3ce9-49eb-8658-53398bd3ae1e" />
