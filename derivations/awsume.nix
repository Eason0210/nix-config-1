{ python37Packages }:
let
  inherit (python37Packages) buildPythonApplication fetchPypi;
in
buildPythonApplication rec {
  pname = "awsume";
  version = "4.5.3";
  buildInputs = with python37Packages; [ psutil boto3 colorama pluggy pyyaml ];

  src = fetchPypi {
    inherit pname version;
    sha256 = "1vskyimp42s48azmaqr2rwacwh861j4f4wh54yw0vk7ks30w8k79";
  };

  AWSUME_SKIP_ALIAS_SETUP = "YES";
}
