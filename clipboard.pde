import java.awt.image.*;
import java.awt.*;

   //hey this is a commit example
   import java.awt.datatransfer.*;

   import javax.imageio.*;

void setup(){
  size(200,200);
  background(0);
  BufferedImage img=null;
  try{
  img = ImageIO.read(new File(args[0]));//path to image file
  } catch (IOException e) {
    print(e);
}
//BufferedImage img =
//  new BufferedImage(width, height,
//    (g.format == ARGB) ? BufferedImage.TYPE_INT_ARGB ://for screenshot
//      BufferedImage.TYPE_INT_RGB);
//g.loadPixels();
//clipBoardImage.setRGB(0, 0, width, height, g.pixels, 0, width);

        ImageSelection imageSelection = new ImageSelection(img);
        Toolkit toolkit = Toolkit.getDefaultToolkit();
        toolkit.getSystemClipboard().setContents(imageSelection, null);

}
void draw(){}
public class ImageSelection implements Transferable {
    private Image image;
   

   
    public ImageSelection(Image image) {
        this.image = image;//added on
    }
   
    public Object getTransferData(DataFlavor flavor) throws UnsupportedFlavorException {
        if (flavor.equals(DataFlavor.imageFlavor) == false) {
            throw new UnsupportedFlavorException(flavor);//usually with transferable
        }
        return image;
    }
   
    public boolean isDataFlavorSupported(DataFlavor flavor) {
        return flavor.equals(DataFlavor.imageFlavor);//usually with transferable
    }
   
    public DataFlavor[] getTransferDataFlavors() {
        return new DataFlavor[] {
            DataFlavor.imageFlavor//usually with transferable
        };
    }
}