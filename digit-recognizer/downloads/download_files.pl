#
#   Be sure to start MozRepl firefox an in firefox:
#   Tools -> MozRepl -> Start
#
use warnings;
use strict;

use WWW::Mechanize::Firefox;

my $mech = WWW::Mechanize::Firefox->new();

$mech -> save_url('http://www.kaggle.com/c/digit-recognizer/download/train.csv'        , 'train.csv'        );
$mech -> save_url('http://www.kaggle.com/c/digit-recognizer/download/test.csv'         , 'test.csv'         );
$mech -> save_url('http://www.kaggle.com/c/digit-recognizer/download/knn_benchmark.R'  , 'knn_benchmark.R'  );
$mech -> save_url('http://www.kaggle.com/c/digit-recognizer/download/knn_benchmark.csv', 'knn_benchmark.csv');
$mech -> save_url('http://www.kaggle.com/c/digit-recognizer/download/rf_benchmark.csv' , 'rf_benchmark.csv' );
