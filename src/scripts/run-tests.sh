xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' /opt/unity/Editor/Unity \
 -batchmode \
 -projectPath "$(pwd)/src" \
 -runTests \
 -testPlatform PlayMode \
 -testResults ./results.xml \
 -logFile /dev/stdout

UNITY_EXIT_CODE=$?

if [ $UNITY_EXIT_CODE -eq 0 ]; then
    echo "Run succeeded, no failures occurred";
elif [ $UNITY_EXIT_CODE -eq 2 ]; then
    echo "Run succeeded, some tests failed";
elif [ $UNITY_EXIT_CODE -eq 3 ]; then
    echo "Run failure (other failure)";
else
    echo "Unexpected exit code $UNITY_EXIT_CODE";
fi

grep -e 'test-suite.*passed.*' src/results.xml