//#include <staticSaliencyFineGrained.h>
#include <opencv2/core/utility.hpp>
#include <opencv2/saliency.hpp>
#include <opencv2/highgui.hpp>
#include <iostream>
#include <fstream>

using namespace std;
using namespace cv;
using namespace saliency;

int main(int argc, char* argv[])
{

    String saliency_algorithm = "SPECTRAL_RESIDUAL";
    String video_name = "TheRedBalloon.mp4";
    int start_frame = 1000;
    String training_path = "";

      //open the capture
    VideoCapture cap;
    cap.open( video_name );
    cap.set( CAP_PROP_POS_FRAMES, start_frame );

    Mat frame;

    // output to file
    ofstream myfile;
    int index = 0;
    double startTime;
    double endTime;
    double frameTime = 1.0/24;
    string header = "index\tstartTime\tendTime\tposX\tposY\n";
    string filePath = "saliency_out.txt";
    myfile.open(filePath);
    if (!myfile.is_open()) {
      cout << "Error: cannot write to file!\n";
      return -1;
    }
    myfile << header;


  //instantiates the specific Saliency
  Ptr<Saliency> saliencyAlgorithm = Saliency::create( saliency_algorithm );

  if( saliencyAlgorithm == NULL )
  {
    cout << "***Error in the instantiation of the saliency algorithm...***\n";
    return -1;
  }

  Mat binaryMap;
  Mat image;

  cap >> frame;
  if( frame.empty() )
  {
    return 0;
  }

  frame.copyTo( image );

  if( saliency_algorithm.find( "SPECTRAL_RESIDUAL" ) == 0 )
  {
    /*
    Mat saliencyMap;
    if( saliencyAlgorithm->computeSaliency( image, saliencyMap ) )
    {
      StaticSaliencySpectralResidual spec;
      spec.computeBinaryMap( saliencyMap, binaryMap );

      imshow( "Saliency Map", saliencyMap );
      //imshow( "Original Image", image );
      //imshow( "Binary Map", binaryMap );
      waitKey( 0 );
    }*/
    int blur_size = 7;
    bool paused = false;
    for ( ;; )
    {
      if( !paused )
      {
        index++;
        startTime = (index -1 ) * frameTime;
        endTime = index * frameTime;

        cap >> frame;
        cvtColor( frame, frame, COLOR_BGR2GRAY );

        Mat saliencyMap;
        if( saliencyAlgorithm->computeSaliency( frame, saliencyMap ) )
        {
          //StaticSaliencySpectralResidual spec;
          //spec.computeBinaryMap( saliencyMap, binaryMap );
          
          // caussianBlur
          Mat gaussianBlur;
          GaussianBlur(saliencyMap, gaussianBlur, Size(blur_size, blur_size), 0, 0);
          double minVal, maxVal;
          Point minLoc, maxLoc;
          minMaxLoc(gaussianBlur, &minVal, &maxVal, &minLoc, &maxLoc);
          // draw circle
          circle(frame, maxLoc, blur_size, Scalar(255, 0, 0), 2);
          myfile << index << "\t" << startTime << "\t" << endTime << "\t" << maxLoc.x << "\t" << maxLoc.y << "\n";

          imshow( "Saliency Map", saliencyMap );
          imshow( "Original Image", frame);
          //imshow( "Binary Map", binaryMap );
        } 
      }

      char c = (char) waitKey( 2 );
      if( c == 'q' )
        break;
      if( c == 'p' )
        paused = !paused;

    }

  }
  else if( saliency_algorithm.find( "BING" ) == 0 )
  {
    if( training_path.empty() )
    {

      cout << "Path of trained files missing! " << endl;
      return -1;
    }

    else
    {
      vector<Vec4i> saliencyMap;
      saliencyAlgorithm.dynamicCast<ObjectnessBING>()->setTrainingPath( training_path );
      saliencyAlgorithm.dynamicCast<ObjectnessBING>()->setBBResDir( training_path + "/Results" );

      if( saliencyAlgorithm->computeSaliency( image, saliencyMap ) )
      {
        std::cout << "Objectness done" << std::endl;
      }
    }

  }
  else if( saliency_algorithm.find( "BinWangApr2014" ) == 0 )
  {

    //Ptr<Size> size = Ptr<Size>( new Size( image.cols, image.rows ) );
    saliencyAlgorithm.dynamicCast<MotionSaliencyBinWangApr2014>()->setImagesize( image.cols, image.rows );
    saliencyAlgorithm.dynamicCast<MotionSaliencyBinWangApr2014>()->init();

    bool paused = false;
    for ( ;; )
    {
      if( !paused )
      {

        cap >> frame;
        cvtColor( frame, frame, COLOR_BGR2GRAY );

        Mat saliencyMap;
        if( saliencyAlgorithm->computeSaliency( frame, saliencyMap ) )
        {
          //std::cout << "current frame motion saliency done" << std::endl;
        }

        imshow( "image", frame );
        imshow( "saliencyMap", saliencyMap * 255 );
      }

      char c = (char) waitKey( 2 );
      if( c == 'q' )
        break;
      if( c == 'p' )
        paused = !paused;

    }
  }  

 return 0;
}
