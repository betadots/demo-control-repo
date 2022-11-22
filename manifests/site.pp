# Resource defaults
File {
  backup => false,
}
Exec {
  path => $facts['path'],
}

# Node classification - solution 2 - Hash
# e.g.
# windows_classes_hash:
#   'identifier': 'class_a'
# linux_classes_hash:
#   'identifier': 'class_b'
#
# overwriting identifiers:
# windows_classes_hash:
#   'identifier': ''
#
$kernel_down=$facts['kernel'].downcase
lookup("${kernel_down}_classes_hash", { 'value_type' => Hash, 'default_value' => {} }).each |$name, $c| {
  if $c != '' {
    contain $c
  } else {
    echo { "Class for ${name} on ${facts['networking']['fqdn']} is disabled": }
  }
}
node default {}
