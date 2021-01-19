import XMonad
import XMonad.Config.Desktop
import XMonad.Layout.Gaps
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig ( additionalKeys )

main :: IO ()
main = launch myConfig
  where myConfig = desktopConfig
          { terminal = "alacritty"
          , focusedBorderColor = "#5e81ac"
          , borderWidth = 2
          , layoutHook =
            spacingRaw
               False
               (Border 0 10 10 10)
               False
               (Border 10 10 10 10)
               True
             $ gaps [(d, 10) | d <- [U, D, L, R]]
             $ layoutHook desktopConfig
          , startupHook = do
              startupHook desktopConfig
              spawn "bgs -z Pictures/wallpapers/a0il9g1km4461.jpg &"
              -- spawn "trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 15 --height 12 --transparent true &"
          }
          `additionalKeys`
          [   ((mod4Mask, xK_q), restart "xmonad" True)
              , ((mod1Mask, xK_p), spawn "rofi -modi \"window,run,ssh,combi\" -show combi")
          ]  
