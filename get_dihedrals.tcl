mol addfile "output.pdb" type pdb

# Select all residues of the polymer
set polymer [atomselect top "resname AAMD and name C1"]
set residues [$polymer get resid]
set last_residue [lindex $$residues end]
set dtypes {intra inter}

set output_intra [open "intra.csv" w]
set output_inter [open "inter.csv" w]

set inter_vec {}; global inter_vec
set intra_vec {}; global intra_vec

# Loop over each dihedral type
foreach dtype $dtypes {
 
  # puts "Calculating $dtype-monomer dihedrals..."	
  # puts "$dtype:"	

  # Loop over each residue
  foreach residue $residues {

    if {$residue == $last_residue} { break }
    
    # Condition for intra-monomer diedrals
    if {$dtype == "intra" && $residue == 1} { continue }
   
    set next_residue [expr {$residue + 1}]
    set previous_residue [expr {$residue - 1}]
    
    # Selection for intra-monomer diedrals
    if {$dtype == "intra"} {set sel [atomselect top "resname AAMD and resid $previous_residue and name C2 or resid $residue and name C1 C2 or resid $next_residue and name C1"]}

    # Selection for inter-monomer dihedrals
    if {$dtype == "inter"} {set sel [atomselect top "resname AAMD and resid $residue $next_residue and name C1 C2"]}
     
    set indices [$sel get index]
    
    # puts $indices
        
    if {[llength $indices] == 4} {
      set dihedral [measure dihed $indices]
      if { $dtype == "intra" } { puts "The dihedral intra-monomer angle for the residue $residue is: $dihedral graus"; lappend intra_vec $dihedral }
      if { $dtype == "inter" } { puts "The dihedral inter-monomer angle between residues $residue and $next_residue is: $dihedral graus"; lappend inter_vec $dihedral }
    } else {
      puts "Error: The number of selected atoms is not 4, unable to calculate the dihedral angle."
    }

    $sel delete   

  }

}

set intra_lenght [ llength $intra_vec ]
set inter_lenght [ llength $inter_vec ]

# puts "o tamanho da lista intra é: $intra_lenght"
# puts "o tamanho da lista inter é: $inter_lenght"

for {set i 0} { $i < $intra_lenght } {incr i } {
  set intra_value [lindex $intra_vec $i]
  puts $output_intra "$intra_value"
}

for {set i 0} { $i < $inter_lenght } {incr i } {
  set inter_value [lindex $inter_vec $i]
  puts $output_inter "$inter_value"
}


close $output_intra
close $output_inter

mol delete 0

exit

